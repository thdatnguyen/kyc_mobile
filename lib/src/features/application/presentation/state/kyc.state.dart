import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../features/application/domain/entities/application.entities.dart';

part 'kyc.state.freezed.dart';

@freezed
sealed class KycState with _$KycState {
  const factory KycState.loading() = KycLoading;
  const factory KycState.loaded({
    required ApplicationEntity application,
    SubmissionEntity? latestSubmission,
  }) = KycLoaded;
  const factory KycState.error(String message) = KycError;
}
