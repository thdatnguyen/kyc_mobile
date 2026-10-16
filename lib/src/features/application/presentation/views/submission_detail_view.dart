import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/application.entities.dart';
import '../widgets/auth_image.dart';

/// Shows the applicant exactly what they submitted (personal details, document,
/// selfie) — so a verified (or rejected) user can see their own record.
class SubmissionDetailView extends StatelessWidget {
  const SubmissionDetailView({super.key, required this.submission});

  static const path = '/submission';

  final SubmissionEntity submission;

  @override
  Widget build(BuildContext context) {
    final personal = submission.personalDetails;
    final document = submission.document;

    return Scaffold(
      appBar: AppBar(title: Text('Submission v${submission.version}')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _Card(
            title: 'Personal details',
            icon: Icons.person_outline,
            children: [
              _Field(label: 'Full name', value: personal?.fullName),
              _Field(label: 'Date of birth', value: personal?.dateOfBirth),
              _Field(label: 'Nationality', value: personal?.nationality),
              if (personal?.address != null)
                _Field(label: 'Address', value: personal!.address),
              if (personal?.phone != null)
                _Field(label: 'Phone', value: personal!.phone),
            ],
          ),
          const SizedBox(height: 12),
          _Card(
            title: 'Identity document',
            icon: Icons.badge_outlined,
            children: [
              _Field(label: 'Type', value: _documentTypeLabel(document?.type)),
              _Field(label: 'Document number', value: document?.documentNumber),
              _Field(label: 'Name on document', value: document?.fullName),
              _Field(label: 'Date of birth', value: document?.dateOfBirth),
              if (document?.expiryDate != null)
                _Field(label: 'Expiry date', value: document!.expiryDate),
              if (document?.imagePublicId != null) ...[
                const SizedBox(height: 12),
                _ImageBox(publicId: document!.imagePublicId!),
              ],
            ],
          ),
          const SizedBox(height: 12),
          _Card(
            title: 'Selfie',
            icon: Icons.face_outlined,
            children: [
              if (submission.selfie?.imagePublicId != null)
                _ImageBox(publicId: submission.selfie!.imagePublicId!)
              else
                const Text('No selfie uploaded'),
            ],
          ),
        ],
      ),
    );
  }

  String? _documentTypeLabel(String? type) => switch (type) {
        'passport' => 'Passport',
        'national_id' => 'National ID',
        'driving_licence' => 'Driving licence',
        _ => type,
      };
}

class _Card extends StatelessWidget {
  const _Card({required this.title, required this.icon, required this.children});

  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Colours.outline),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: Colours.textSecondary),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({required this.label, required this.value});

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final text = (value == null || value!.isEmpty) ? '—' : value!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(label, style: const TextStyle(color: Colours.textSecondary)),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageBox extends StatelessWidget {
  const _ImageBox({required this.publicId});

  final String publicId;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 180,
        width: double.infinity,
        child: AuthImage(publicId: publicId),
      ),
    );
  }
}
