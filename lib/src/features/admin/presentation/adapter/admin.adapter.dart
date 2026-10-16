import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../features/admin/domain/providers.dart';
import '../../../../features/admin/presentation/state/admin.state.dart';

part 'admin.adapter.g.dart';

@riverpod
class AdminController extends _$AdminController {
  @override
  AdminState build() => const AdminState.loading();

  Future<void> load() async {
    state = const AdminState.loading();
    final result = await ref.read(listPendingReviewsUseCaseProvider).call();
    result.fold(
      (failure) => state = AdminState.error(failure.message),
      (submissions) => state = AdminState.loaded(submissions),
    );
  }

  Future<bool> review({
    required String submissionId,
    required String decision,
    List<String>? reasons,
  }) async {
    final result = await ref.read(reviewSubmissionUseCaseProvider).call(
          submissionId: submissionId,
          decision: decision,
          reasons: reasons,
        );
    return result.fold(
      (failure) {
        state = AdminState.error(failure.message);
        return false;
      },
      (_) => true,
    );
  }

  void clearError() => load();
}
