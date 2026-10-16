import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/storage/draft_store.dart';
import '../../../../features/application/domain/entities/application.entities.dart';
import '../../../../features/application/domain/providers.dart';
import '../../../../features/application/presentation/state/kyc.state.dart';

part 'kyc.adapter.g.dart';

@riverpod
class KycController extends _$KycController {
  @override
  KycState build() => const KycState.loading();

  Future<void> load() async {
    state = const KycState.loading();
    final appResult = await ref.read(getApplicationUseCaseProvider).call();
    final subsResult = await ref.read(listSubmissionsUseCaseProvider).call();

    final application = appResult.fold((_) => null, (a) => a);
    if (application == null) {
      state = KycState.error(
        appResult.fold((f) => f.message, (_) => 'Failed to load'),
      );
      return;
    }

    final latest = subsResult.fold((_) => null, (list) => list.isEmpty ? null : list.first);
    state = KycState.loaded(application: application, latestSubmission: latest);
  }

  Future<bool> saveStep(int step, Map<String, dynamic> data) async {
    final result = await ref.read(saveStepUseCaseProvider).call(step, data);
    return result.fold(
      (failure) {
        return false;
      },
      (application) {
        _merge(application);
        _cacheDraft(application.draft);
        return true;
      },
    );
  }

  Future<SubmitResult?> submit() async {
    final result = await ref.read(submitUseCaseProvider).call();
    return result.fold(
      (failure) {
        return null;
      },
      (result) {
        state = KycState.loaded(
          application: result.application,
          latestSubmission: result.submission,
        );
        ref.read(draftStoreProvider).clear();
        return result;
      },
    );
  }

  Future<void> resubmit() async {
    final result = await ref.read(resubmitUseCaseProvider).call();
    result.fold(
      (failure) => _reportError(failure),
      (application) => state = KycState.loaded(application: application, latestSubmission: null),
    );
  }

  void clearError() {
    final current = state;
    if (current is KycError) {
      state = const KycState.loading();
      load();
    }
  }

  void _merge(ApplicationEntity application) {
    final current = state;
    final latest = current is KycLoaded ? current.latestSubmission : null;
    state = KycState.loaded(application: application, latestSubmission: latest);
  }

  void _reportError(Failure failure) {
    state = KycState.error(failure.message);
  }

  /// Mirrors the server draft into encrypted local storage (resume cache).
  void _cacheDraft(DraftEntity? draft) {
    if (draft == null) return;
    ref.read(draftStoreProvider).write(jsonEncode(draft.toJson()));
  }
}
