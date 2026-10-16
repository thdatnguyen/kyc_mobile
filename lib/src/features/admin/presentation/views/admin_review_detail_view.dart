import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../features/application/domain/entities/application.entities.dart';
import '../../../../features/application/presentation/widgets/auth_image.dart';
import '../adapter/admin.adapter.dart';

class AdminReviewDetailView extends ConsumerStatefulWidget {
  const AdminReviewDetailView({super.key, required this.submission});

  static const path = '/admin/review';

  final SubmissionEntity submission;

  @override
  ConsumerState<AdminReviewDetailView> createState() => _AdminReviewDetailViewState();
}

class _AdminReviewDetailViewState extends ConsumerState<AdminReviewDetailView> {
  bool _busy = false;

  Future<void> _approve() async {
    setState(() => _busy = true);
    final ok = await ref.read(adminControllerProvider.notifier).review(
          submissionId: widget.submission.id,
          decision: 'approve',
        );
    if (!mounted) return;
    setState(() => _busy = false);
    if (ok) context.pop(true);
  }

  Future<void> _reject() async {
    final reason = await _showRejectDialog();
    if (reason == null || reason.isEmpty) return;
    setState(() => _busy = true);
    final ok = await ref.read(adminControllerProvider.notifier).review(
          submissionId: widget.submission.id,
          decision: 'reject',
          reasons: [reason],
        );
    if (!mounted) return;
    setState(() => _busy = false);
    if (ok) context.pop(true);
  }

  Future<String?> _showRejectDialog() {
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Rejection reason'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'e.g. document expired'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('Reject'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.submission;
    final personal = s.personalDetails;
    final document = s.document;
    final docImageId = document?.imagePublicId;
    final selfieImageId = s.selfie?.imagePublicId;

    return Scaffold(
      appBar: AppBar(title: Text('Review v${s.version}')),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _busy ? null : _reject,
                  style: OutlinedButton.styleFrom(foregroundColor: Colours.error),
                  child: const Text('Reject'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: _busy ? null : _approve,
                  child: _busy
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text('Approve'),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Field(label: 'Full name', value: personal?.fullName ?? '—'),
            _Field(label: 'Date of birth', value: personal?.dateOfBirth ?? '—'),
            _Field(label: 'Nationality', value: personal?.nationality ?? '—'),
            const Divider(height: 32),
            _Field(label: 'Document', value: '${document?.type} · ${document?.documentNumber}'),
            _Field(label: 'Name on document', value: document?.fullName ?? '—'),
            _Field(label: 'Expiry', value: document?.expiryDate ?? '—'),
            const SizedBox(height: 16),
            if (docImageId != null && docImageId.isNotEmpty) ...[
              Text('Document images', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              SizedBox(
                height: 140,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: docImageId
                      .split(',')
                      .where((str) => str.trim().isNotEmpty)
                      .length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (context, i) {
                    final id = docImageId
                        .split(',')
                        .where((str) => str.trim().isNotEmpty)
                        .elementAt(i);
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 140,
                        height: 140,
                        child: AuthImage(publicId: id, fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
              ),
            ],
            const SizedBox(height: 16),
            if (selfieImageId != null && selfieImageId.isNotEmpty) ...[
              Text('Selfie', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: AuthImage(publicId: selfieImageId, fit: BoxFit.cover),
                ),
              ),
            ],
            const SizedBox(height: 16),
            Text('Checks', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            for (final check in s.checks ?? const <CheckResultEntity>[])
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  check.passed ? Icons.check_circle : Icons.cancel,
                  color: check.passed ? Colours.success : Colours.error,
                ),
                title: Text(check.name),
                subtitle: check.message == null ? null : Text(check.message!),
              ),
          ],
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 130, child: Text(label, style: const TextStyle(color: Colours.textSecondary))),
          Expanded(child: Text(value, style: const TextStyle(fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }
}
