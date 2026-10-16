import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/ppac_logo.dart';
import '../../../../features/auth/presentation/adapter/auth.adapter.dart';
import '../../../../features/auth/presentation/state/auth.state.dart';
import '../../domain/entities/application.entities.dart';
import '../adapter/kyc.adapter.dart';
import '../state/kyc.state.dart';
import 'kyc_flow_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const path = '/home';

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(kycControllerProvider.notifier).load();
    });
  }

  Future<void> _handleResubmit() async {
    await ref.read(kycControllerProvider.notifier).resubmit();
    if (mounted) {
      context.go(KycFlowView.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authControllerProvider);
    final kyc = ref.watch(kycControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            PpacLogo(
              variant: PpacLogoVariant.darkGreen,
              height: 28,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authControllerProvider.notifier).logout(),
          ),
        ],
      ),
      body: switch (kyc) {
        KycLoading() => const Center(child: CircularProgressIndicator()),
        KycError(:final message) => _ErrorState(message: message, onRetry: _reload),
        KycLoaded(:final application, :final latestSubmission) => _Dashboard(
            application: application,
            latestSubmission: latestSubmission,
            email: auth is AuthAuthenticated ? auth.user.email : '',
            onContinue: () => context.go(KycFlowView.path),
            onResubmit: _handleResubmit,
          ),
      },
    );
  }

  void _reload() => ref.read(kycControllerProvider.notifier).load();
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, color: Colours.error, size: 48),
          const SizedBox(height: 12),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          OutlinedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}

class _Dashboard extends StatelessWidget {
  const _Dashboard({
    required this.application,
    required this.latestSubmission,
    required this.email,
    required this.onContinue,
    required this.onResubmit,
  });

  final ApplicationEntity application;
  final SubmissionEntity? latestSubmission;
  final String email;
  final VoidCallback onContinue;
  final VoidCallback onResubmit;

  @override
  Widget build(BuildContext context) {
    final status = application.status;
    final reasons = latestSubmission?.adminReview?.reasons ?? const <String>[];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Signed in as $email', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 24),
          Card(
            color: Colors.white,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Colours.outline),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _StatusHeader(
                    status: status,
                    latestSubmission: latestSubmission,
                  ),
                  if (status == 'REJECTED') ...[
                    const SizedBox(height: 12),
                    if (reasons.isNotEmpty) ...[
                      const Text('Rejection reasons:',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      for (final r in reasons) Text('• $r'),
                      const SizedBox(height: 12),
                    ],
                    ElevatedButton(
                      onPressed: onResubmit,
                      child: const Text('Edit & resubmit'),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          if (status == 'DRAFT')
            ElevatedButton(
              onPressed: onContinue,
              child: Text(latestSubmission != null
                  ? 'Continue resubmission'
                  : 'Continue verification'),
            ),
        ],
      ),
    );
  }
}

class _StatusHeader extends StatelessWidget {
  const _StatusHeader({
    required this.status,
    this.latestSubmission,
  });

  final String status;
  final SubmissionEntity? latestSubmission;

  @override
  Widget build(BuildContext context) {
    final (icon, color, label) = switch (status) {
      'APPROVED' => (Icons.verified, Colours.success, 'Identity verified'),
      'REJECTED' => (Icons.cancel, Colours.error, 'Verification rejected'),
      'NEEDS_REVIEW' || 'SUBMITTED' => (Icons.pending, Colours.warning, 'Under review'),
      'DRAFT' => latestSubmission != null
          ? (
              Icons.edit_note,
              Colours.warning,
              'Editing resubmission (v${latestSubmission!.version + 1})'
            )
          : (Icons.info_outline, Colours.textSecondary, 'Not submitted'),
      _ => (Icons.info_outline, Colours.textSecondary, 'Not submitted'),
    };
    return Row(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colours.textPrimary,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
