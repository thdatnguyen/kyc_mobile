import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/ppac_logo.dart';
import '../../../../features/application/domain/entities/application.entities.dart';
import '../../../../features/auth/presentation/adapter/auth.adapter.dart';
import '../adapter/admin.adapter.dart';
import '../state/admin.state.dart';
import 'admin_review_detail_view.dart';

class AdminView extends ConsumerStatefulWidget {
  const AdminView({super.key});

  static const path = '/admin';

  @override
  ConsumerState<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends ConsumerState<AdminView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(adminControllerProvider.notifier).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adminControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Text('PPAC Admin Review')],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authControllerProvider.notifier).logout(),
          ),
        ],
      ),
      body: switch (state) {
        AdminLoading() => const Center(child: CircularProgressIndicator()),
        AdminError(:final message) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message),
                TextButton(
                  onPressed: () => ref.read(adminControllerProvider.notifier).load(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        AdminLoaded(:final submissions) => submissions.isEmpty
            ? const Center(child: Text('No pending reviews'))
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: submissions.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, i) => _ReviewCard(
                  submission: submissions[i],
                  onTap: () async {
                    await context.push(AdminReviewDetailView.path, extra: submissions[i]);
                    if (context.mounted) {
                      ref.read(adminControllerProvider.notifier).load();
                    }
                  },
                ),
              ),
      },
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.submission, required this.onTap});

  final SubmissionEntity submission;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final name = submission.personalDetails?.fullName ?? 'Unknown applicant';
    final doc = submission.document?.type ?? '—';
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Colours.outline),
      ),
      child: ListTile(
        leading: const Icon(Icons.pending_actions, color: Colours.warning),
        title: Text(name),
        subtitle: Text('v${submission.version} · $doc'),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
