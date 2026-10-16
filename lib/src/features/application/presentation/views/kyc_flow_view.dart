// ignore_for_file: sort_child_properties_last
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../features/application/domain/entities/application.entities.dart';
import '../../../../features/application/domain/providers.dart';
import '../../../../features/application/services/ml_service.dart';
import '../adapter/kyc.adapter.dart';
import '../state/kyc.state.dart';
import '../widgets/auth_image.dart';
import '../widgets/camera_capture.dart';

class KycFlowView extends ConsumerStatefulWidget {
  const KycFlowView({super.key});

  static const path = '/kyc';

  @override
  ConsumerState<KycFlowView> createState() => _KycFlowViewState();
}

class _KycFlowViewState extends ConsumerState<KycFlowView> {
  int _step = 0;
  bool _stepInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.read(kycControllerProvider) is! KycLoaded) {
        ref.read(kycControllerProvider.notifier).load();
      }
    });
  }

  int _resumeStep(DraftEntity? draft) {
    if (draft == null) return 0;
    if (draft.selfie != null) return 2;
    if (draft.document != null || draft.personalDetails != null) return 1;
    return 0;
  }

  void _handleGoBack() {
    if (_step > 0) {
      setState(() => _step = _step - 1);
    } else {
      if (context.canPop()) {
        context.pop();
      } else {
        context.go('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<KycState>(kycControllerProvider, (prev, next) {
      if (next is KycLoaded && !_stepInitialized) {
        _stepInitialized = true;
        _step = _resumeStep(next.application.draft);
        if (mounted) setState(() {});
      }
    });

    final kyc = ref.watch(kycControllerProvider);
    if (kyc is KycLoaded && !_stepInitialized) {
      _stepInitialized = true;
      _step = _resumeStep(kyc.application.draft);
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _handleGoBack();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Verification — step ${_step + 1} of 3'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _handleGoBack,
          ),
        ),
        body: switch (kyc) {
          KycLoading() => const Center(child: CircularProgressIndicator()),
          KycError(:final message) => Center(child: Text(message)),
          KycLoaded(:final application) => switch (_step) {
              0 => IdentityDocumentAndDetailsStep(
                  personalInitial: application.draft?.personalDetails,
                  docInitial: application.draft?.document,
                  onDone: () => setState(() => _step = 1),
                ),
              1 => SelfieStep(
                  initial: application.draft?.selfie,
                  onDone: () => setState(() => _step = 2),
                  onBack: () => setState(() => _step = 0),
                ),
              _ => ReviewStep(
                  draft: application.draft,
                  onSubmit: _submit,
                  onBack: () => setState(() => _step = 1),
                ),
            },
        },
      ),
    );
  }

  Future<bool> _submit() async {
    final result = await ref.read(kycControllerProvider.notifier).submit();
    if (result != null && mounted) {
      context.go('/home');
      return true;
    }
    return false;
  }
}

Future<String?> _pickDate(BuildContext context, {String? initial}) async {
  final now = DateTime.now();
  final picked = await showDatePicker(
    context: context,
    initialDate: initial != null ? DateTime.tryParse(initial) ?? now : now,
    firstDate: DateTime(1900),
    lastDate: now,
  );
  if (picked == null) return null;
  return DateFormat('yyyy-MM-dd').format(picked);
}

// ---------------------------------------------------------------------------
// Step 0 — Identity Document & Personal Details (Combined)
// ---------------------------------------------------------------------------
class IdentityDocumentAndDetailsStep extends ConsumerStatefulWidget {
  const IdentityDocumentAndDetailsStep({
    super.key,
    required this.personalInitial,
    required this.docInitial,
    required this.onDone,
  });

  final PersonalDetailsEntity? personalInitial;
  final DocumentInfoEntity? docInitial;
  final VoidCallback onDone;

  @override
  ConsumerState<IdentityDocumentAndDetailsStep> createState() =>
      _IdentityDocumentAndDetailsStepState();
}

class _IdentityDocumentAndDetailsStepState
    extends ConsumerState<IdentityDocumentAndDetailsStep> {
  final _formKey = GlobalKey<FormState>();

  late String _type = widget.docInitial?.type ?? 'national_id';
  late final _number =
      TextEditingController(text: widget.docInitial?.documentNumber ?? '');
  late final _fullName = TextEditingController(
      text: widget.docInitial?.fullName ?? widget.personalInitial?.fullName ?? '');
  late final _nationality = TextEditingController(
      text: widget.personalInitial?.nationality ?? 'Vietnamese');
  late final _address =
      TextEditingController(text: widget.personalInitial?.address ?? '');
  late final _phone =
      TextEditingController(text: widget.personalInitial?.phone ?? '');

  String? _dob;
  String? _expiry;
  final List<String> _imagePaths = [];
  final List<String> _publicIds = [];
  String _ocrText = '';
  bool _scanningQr = false;
  bool _capturingPhoto = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _dob = widget.docInitial?.dateOfBirth ?? widget.personalInitial?.dateOfBirth;
    _expiry = widget.docInitial?.expiryDate;
    final initialId = widget.docInitial?.imagePublicId;
    if (initialId != null && initialId.isNotEmpty) {
      _publicIds.addAll(
        initialId.split(',').where((s) => s.trim().isNotEmpty),
      );
    }
  }

  @override
  void dispose() {
    _number.dispose();
    _fullName.dispose();
    _nationality.dispose();
    _address.dispose();
    _phone.dispose();
    super.dispose();
  }

  /// Action 1: Scan QR Code (Only for National ID Card)
  /// Note: Only parses QR details and auto-fills fields, does NOT display or store image!
  Future<void> _scanQrCode() async {
    final path = await Navigator.of(context).push<String>(
      MaterialPageRoute(
          builder: (_) =>
              const CameraCaptureView(front: false, title: 'Scan QR Code')),
    );
    if (path == null) return;
    setState(() => _scanningQr = true);
    try {
      final ocr = await ref.read(mlServiceProvider).recognizeDocument(path);
      if (!mounted) return;
      setState(() {
        _ocrText = ocr.rawText;
        if (ocr.number != null && ocr.number!.isNotEmpty) {
          _number.text = ocr.number!;
        }
        if (ocr.fullName != null && ocr.fullName!.isNotEmpty) {
          _fullName.text = ocr.fullName!;
        }
        if (ocr.dateOfBirth != null && ocr.dateOfBirth!.isNotEmpty) {
          _dob = ocr.dateOfBirth;
        }
        if (ocr.expiryDate != null && ocr.expiryDate!.isNotEmpty) {
          _expiry = ocr.expiryDate;
        }
        if (ocr.nationality != null && ocr.nationality!.isNotEmpty) {
          _nationality.text = ocr.nationality!;
        }
        if (ocr.address != null && ocr.address!.isNotEmpty) {
          _address.text = ocr.address!;
        }
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(ocr.isQrScanned
              ? 'QR code scanned successfully! Details auto-filled below.'
              : 'Card scanned. Details pre-filled below.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to scan QR: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _scanningQr = false);
    }
  }

  /// Action 2: Capture Document Photo (Multiple photos allowed)
  Future<void> _capturePhoto() async {
    final path = await Navigator.of(context).push<String>(
      MaterialPageRoute(
          builder: (_) => const CameraCaptureView(
              front: false, title: 'Capture Document Photo')),
    );
    if (path == null) return;
    setState(() => _capturingPhoto = true);
    try {
      final publicId = await _doUpload(path, 'document');
      if (!mounted) return;
      setState(() {
        _imagePaths.add(path);
        _publicIds.add(publicId);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Document photo added (Total: ${_publicIds.length})'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to capture photo: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _capturingPhoto = false);
    }
  }

  void _removePhoto(int index) {
    setState(() {
      if (index < _imagePaths.length) {
        _imagePaths.removeAt(index);
      }
      if (index < _publicIds.length) {
        _publicIds.removeAt(index);
      }
    });
  }

  Future<String> _doUpload(String path, String kind) async {
    final bytes = await File(path).readAsBytes();
    final result = await ref.read(uploadImageUseCaseProvider).call(
          bytes: bytes,
          filename: '$kind-${DateTime.now().millisecondsSinceEpoch}.jpg',
          mimeType: 'image/jpeg',
          kind: kind,
        );
    return result.fold((f) => throw Exception(f.message), (id) => id);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_publicIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please capture at least one document photo')),
      );
      return;
    }
    if (_dob == null || _dob!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select your date of birth')),
      );
      return;
    }

    setState(() => _saving = true);

    try {
      // 1. Prepare Personal Details payload (Step 0) - omit null/empty optional values
      final personalData = <String, dynamic>{
        'fullName': _fullName.text.trim(),
        'dateOfBirth': _dob,
        'nationality': _nationality.text.trim(),
      };
      if (_address.text.trim().isNotEmpty) {
        personalData['address'] = _address.text.trim();
      }
      if (_phone.text.trim().isNotEmpty) {
        personalData['phone'] = _phone.text.trim();
      }

      final okPersonal =
          await ref.read(kycControllerProvider.notifier).saveStep(0, personalData);

      if (!okPersonal) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to save personal details. Please verify your inputs.'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
        return;
      }

      // 2. Prepare Document Details payload (Step 1) - omit null/empty optional values
      final docData = <String, dynamic>{
        'type': _type,
        'documentNumber': _number.text.trim(),
        'fullName': _fullName.text.trim(),
        'dateOfBirth': _dob,
        'imagePublicId': _publicIds.join(','),
      };
      if (_expiry != null && _expiry!.isNotEmpty) {
        docData['expiryDate'] = _expiry;
      }

      final okDoc =
          await ref.read(kycControllerProvider.notifier).saveStep(1, docData);

      if (!okDoc) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to save document details. Please verify your inputs.'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
        return;
      }

      if (mounted) widget.onDone();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving details: $e'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isNationalId = _type == 'national_id';
    final hasPhotos = _publicIds.isNotEmpty || _imagePaths.isNotEmpty;
    final isBusy = _scanningQr || _capturingPhoto;

    return _StepForm(
      title: 'Identity & Details',
      subtitle:
          'Select your document type, scan QR code or capture photo(s), then review your details.',
      formKey: _formKey,
      children: [
        // -------------------------------------------------------------------
        // 1. SELECT DOCUMENT TYPE FIRST (#2 requirement)
        // -------------------------------------------------------------------
        const Text(
          '1. Document Type',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colours.primary),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue: _type,
          decoration: const InputDecoration(
            labelText: 'Select Document Type',
            prefixIcon: Icon(Icons.badge_outlined),
          ),
          items: const [
            DropdownMenuItem(
                value: 'national_id', child: Text('National ID Card')),
            DropdownMenuItem(value: 'passport', child: Text('Passport')),
            DropdownMenuItem(
                value: 'driving_licence', child: Text('Driving Licence')),
          ],
          onChanged: (v) {
            setState(() => _type = v ?? 'national_id');
          },
        ),
        const SizedBox(height: 20),

        // -------------------------------------------------------------------
        // 2. SCAN & CAPTURE SEPARATED ACTIONS
        // -------------------------------------------------------------------
        const Text(
          '2. Scan & Capture',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colours.primary),
        ),
        const SizedBox(height: 8),

        // Multiple Photo Thumbnails Display
        if (hasPhotos) ...[
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _publicIds.length + 1,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                if (index == _publicIds.length) {
                  // "Add Photo" Card
                  return InkWell(
                    onTap: isBusy ? null : _capturePhoto,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: Colours.brandGreen, width: 1.5),
                        color: Colours.brandGreen.withValues(alpha: 0.05),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo_outlined,
                              color: Colours.brandGreen, size: 28),
                          SizedBox(height: 6),
                          Text(
                            'Add Photo',
                            style: TextStyle(
                              color: Colours.brandGreen,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                final hasLocal = index < _imagePaths.length;
                final publicId = _publicIds[index];

                return Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colours.outline),
                        color: Colors.black12,
                      ),
                      child: hasLocal
                          ? Image.file(File(_imagePaths[index]),
                              fit: BoxFit.cover)
                          : AuthImage(publicId: publicId, fit: BoxFit.cover),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: InkWell(
                        onTap: () => _removePhoto(index),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.close,
                              color: Colors.white, size: 16),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      left: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Photo #${index + 1}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 12),
        ],

        // Separated Action Buttons
        if (isNationalId) ...[
          // Action A: Scan QR Code (Only for National ID, auto-fills text, NO image displayed)
          ElevatedButton.icon(
            onPressed: isBusy ? null : _scanQrCode,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colours.brandGreen,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            icon: _scanningQr
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: Colors.white))
                : const Icon(Icons.qr_code_scanner),
            label: const Text('Scan QR Code (Auto-fill details)'),
          ),
          const SizedBox(height: 8),
          // Action B: Capture Document Photo(s)
          OutlinedButton.icon(
            onPressed: isBusy ? null : _capturePhoto,
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            icon: _capturingPhoto
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.camera_alt_outlined),
            label: Text(hasPhotos
                ? 'Capture Additional Photo'
                : 'Capture Document Photo'),
          ),
        ] else ...[
          // Passport / Driving Licence: Only Capture Photo enabled
          ElevatedButton.icon(
            onPressed: isBusy ? null : _capturePhoto,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colours.primary,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            icon: _capturingPhoto
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: Colors.white))
                : const Icon(Icons.camera_alt),
            label: Text(hasPhotos
                ? 'Capture Additional Photo'
                : 'Capture Document Photo'),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, size: 16, color: Colours.textSecondary),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'QR code scanning is available for National ID Cards.',
                    style:
                        TextStyle(fontSize: 12, color: Colours.textSecondary),
                  ),
                ),
              ],
            ),
          ),
        ],

        if (_ocrText.isNotEmpty && isNationalId) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colours.brandBeige,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.auto_awesome,
                    color: Colours.brandGreen, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Details auto-extracted via QR scan! Verify below.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colours.primary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],

        const SizedBox(height: 20),

        // -------------------------------------------------------------------
        // 3. DOCUMENT & PERSONAL INFORMATION FIELDS
        // -------------------------------------------------------------------
        const Text(
          '3. Document & Personal Details',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colours.primary),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _number,
          decoration: const InputDecoration(
            labelText: 'Document number',
            hintText: 'e.g. 012345678901',
          ),
          validator: (v) =>
              v == null || v.trim().length < 5 ? 'Required' : null,
        ),
        const SizedBox(height: 16),
        _DateField(
          label: 'Expiry date (optional)',
          value: _expiry,
          onTap: () async {
            final d = await _pickDate(context, initial: _expiry);
            if (d != null) setState(() => _expiry = d);
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _fullName,
          decoration: const InputDecoration(
            labelText: 'Full name',
            hintText: 'e.g. JOHN DOE',
          ),
          validator: (v) =>
              v == null || v.trim().length < 2 ? 'Required' : null,
        ),
        const SizedBox(height: 16),
        _DateField(
          label: 'Date of birth',
          value: _dob,
          onTap: () async {
            final d = await _pickDate(context, initial: _dob);
            if (d != null) setState(() => _dob = d);
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _nationality,
          decoration: const InputDecoration(labelText: 'Nationality'),
          validator: (v) =>
              v == null || v.trim().length < 2 ? 'Required' : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _address,
          decoration: const InputDecoration(labelText: 'Address (optional)'),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _phone,
          decoration: const InputDecoration(labelText: 'Phone (optional)'),
          keyboardType: TextInputType.phone,
        ),
      ],
      saving: _saving,
      onContinue: _save,
    );
  }
}

// ---------------------------------------------------------------------------
// Step 1 — Selfie
// ---------------------------------------------------------------------------
class SelfieStep extends ConsumerStatefulWidget {
  const SelfieStep({
    super.key,
    required this.initial,
    required this.onDone,
    this.onBack,
  });

  final SelfieEntity? initial;
  final VoidCallback onDone;
  final VoidCallback? onBack;

  @override
  ConsumerState<SelfieStep> createState() => _SelfieStepState();
}

class _SelfieStepState extends ConsumerState<SelfieStep> {
  String? _imagePath;
  String? _publicId;
  bool _livenessPassed = false;
  bool _processing = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _publicId = widget.initial?.imagePublicId;
    _livenessPassed = widget.initial?.liveness?.passed ?? false;
  }

  Future<void> _capture() async {
    final path = await Navigator.of(context).push<String>(
      MaterialPageRoute(
          builder: (_) =>
              const CameraCaptureView(front: true, title: 'Take a Selfie')),
    );
    if (path == null) return;
    setState(() => _processing = true);
    try {
      final bytes = await File(path).readAsBytes();
      final upload = await ref.read(uploadImageUseCaseProvider).call(
            bytes: bytes,
            filename: 'selfie-${DateTime.now().millisecondsSinceEpoch}.jpg',
            mimeType: 'image/jpeg',
            kind: 'selfie',
          );
      final publicId = upload.fold((f) => throw Exception(f.message), (id) => id);
      final liveness = await ref.read(mlServiceProvider).detectFaceWithEyesOpen(path);
      if (!mounted) return;
      setState(() {
        _imagePath = path;
        _publicId = publicId;
        _livenessPassed = liveness;
      });
    } finally {
      if (mounted) setState(() => _processing = false);
    }
  }

  Future<void> _save() async {
    if (_publicId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please take a selfie first')),
      );
      return;
    }
    setState(() => _saving = true);
    final ok = await ref.read(kycControllerProvider.notifier).saveStep(2, {
      'imagePublicId': _publicId,
      'liveness': {'passed': _livenessPassed, 'method': 'face-presence'},
    });
    if (!mounted) return;
    setState(() => _saving = false);
    if (ok) widget.onDone();
  }

  @override
  Widget build(BuildContext context) {
    return _StepForm(
      title: 'Selfie',
      subtitle: 'Look at the camera and blink',
      children: [
        if (_imagePath != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.file(File(_imagePath!), height: 180, fit: BoxFit.cover),
          )
        else if (_publicId != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: SizedBox(
              height: 180,
              width: double.infinity,
              child: AuthImage(publicId: _publicId!),
            ),
          )
        else
          OutlinedButton.icon(
            onPressed: _processing ? null : _capture,
            icon: _processing
                ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.face),
            label: Text(_publicId != null ? 'Retake selfie' : 'Take selfie'),
          ),
        if (_publicId != null) ...[
          const SizedBox(height: 8),
          Text(
            _livenessPassed ? 'Face detected ✓' : 'Face not detected — please retake',
            style: TextStyle(
              color: _livenessPassed ? Colours.brandGreen : Colours.error,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: _processing ? null : _capture,
            icon: const Icon(Icons.refresh),
            label: const Text('Retake selfie'),
          ),
        ],
      ],
      saving: _saving,
      onContinue: _save,
      onBack: widget.onBack,
    );
  }
}

// ---------------------------------------------------------------------------
// Step 2 — Review
// ---------------------------------------------------------------------------
class ReviewStep extends StatefulWidget {
  const ReviewStep({
    super.key,
    required this.draft,
    required this.onSubmit,
    this.onBack,
  });

  final DraftEntity? draft;
  final Future<bool> Function() onSubmit;
  final VoidCallback? onBack;

  @override
  State<ReviewStep> createState() => _ReviewStepState();
}

class _ReviewStepState extends State<ReviewStep> {
  bool _submitting = false;

  Future<void> _handleSubmit() async {
    final personal = widget.draft?.personalDetails;
    final doc = widget.draft?.document;
    final selfie = widget.draft?.selfie;

    if (personal == null || doc == null || selfie == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Please complete all steps (Identity, Document & Selfie) before submitting.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() => _submitting = true);
    try {
      final ok = await widget.onSubmit();
      if (!ok && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Submission failed. Please check details and try again.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Submission error: $e'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final personal = widget.draft?.personalDetails;
    final doc = widget.draft?.document;
    final selfie = widget.draft?.selfie;

    final isComplete = personal != null && doc != null && selfie != null;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Review details', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 4),
          const Text('Check everything before sending for review.',
              style: TextStyle(color: Colours.textSecondary)),
          const SizedBox(height: 20),

          if (!isComplete) ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colours.warning.withValues(alpha: 0.1),
                border: Border.all(color: Colours.warning),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: Colours.warning),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Some information or steps are incomplete. Please complete all steps before submitting.',
                      style: TextStyle(fontSize: 13, color: Colours.textPrimary),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Personal Details Card
          _SectionCard(
            title: 'Personal details',
            rows: [
              _Row('Full name', personal?.fullName ?? '—'),
              _Row('Date of birth', personal?.dateOfBirth ?? '—'),
              _Row('Nationality', personal?.nationality ?? '—'),
              if (personal?.address != null) _Row('Address', personal!.address!),
              if (personal?.phone != null) _Row('Phone', personal!.phone!),
            ],
          ),
          const SizedBox(height: 16),

          // Document Card
          _SectionCard(
            title: 'Identity document',
            rows: [
              _Row('Type', doc?.type ?? '—'),
              _Row('Document number', doc?.documentNumber ?? '—'),
              _Row('Name on document', doc?.fullName ?? '—'),
              _Row('DOB on document', doc?.dateOfBirth ?? '—'),
              if (doc?.expiryDate != null) _Row('Expiry date', doc!.expiryDate!),
            ],
            imagePublicId: doc?.imagePublicId,
          ),
          const SizedBox(height: 16),

          // Selfie Card
          _SectionCard(
            title: 'Selfie & Liveness',
            rows: [
              _Row(
                'Liveness check',
                selfie?.liveness?.passed == true ? 'PASSED ✓' : 'FAILED ✗',
              ),
            ],
            imagePublicId: selfie?.imagePublicId,
          ),
          const SizedBox(height: 28),

          Row(
            children: [
              if (widget.onBack != null) ...[
                Expanded(
                  child: OutlinedButton(
                    onPressed: _submitting ? null : widget.onBack,
                    child: const Text('Back'),
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: ElevatedButton(
                  onPressed: _submitting ? null : _handleSubmit,
                  child: _submitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Submit'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.rows, this.imagePublicId});

  final String title;
  final List<_Row> rows;
  final String? imagePublicId;

  @override
  Widget build(BuildContext context) {
    final publicIds = imagePublicId != null
        ? imagePublicId!
            .split(',')
            .where((s) => s.trim().isNotEmpty)
            .toList()
        : <String>[];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            if (publicIds.isNotEmpty) ...[
              SizedBox(
                height: 110,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: publicIds.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (context, i) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 110,
                        height: 110,
                        child: AuthImage(publicId: publicIds[i], fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
            ],
            ...rows.map((r) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          r.label,
                          style: const TextStyle(color: Colours.textSecondary),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 3,
                        child: Text(
                          r.value,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class _Row {
  const _Row(this.label, this.value);
  final String label;
  final String value;
}

// ---------------------------------------------------------------------------
// Reusable step container with sticky CTA
// ---------------------------------------------------------------------------
class _StepForm extends StatelessWidget {
  const _StepForm({
    required this.title,
    required this.subtitle,
    required this.children,
    this.formKey,
    this.saving = false,
    this.onContinue,
    this.onBack,
  });

  final String title;
  final String subtitle;
  final List<Widget> children;
  final GlobalKey<FormState>? formKey;
  final bool saving;
  final VoidCallback? onContinue;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final form = Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(title, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colours.textSecondary)),
                const SizedBox(height: 20),
                form,
              ],
            ),
          ),
        ),
        if (onContinue != null || onBack != null)
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  if (onBack != null) ...[
                    Expanded(
                      child: OutlinedButton(
                        onPressed: saving ? null : onBack,
                        child: const Text('Back'),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  if (onContinue != null)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: saving ? null : onContinue,
                        child: saving
                            ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                            : const Text('Continue'),
                      ),
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField({required this.label, required this.value, required this.onTap});

  final String label;
  final String? value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: InputDecorator(
        decoration: InputDecoration(labelText: label),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value != null && value!.isNotEmpty ? value! : 'Select date',
                style: TextStyle(
                  color: value != null && value!.isNotEmpty
                      ? Colours.textPrimary
                      : Colours.textSecondary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.calendar_today, size: 18, color: Colours.textSecondary),
          ],
        ),
      ),
    );
  }
}
