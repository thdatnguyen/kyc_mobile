import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../features/application/domain/entities/application.entities.dart';

part 'admin.state.freezed.dart';

@freezed
sealed class AdminState with _$AdminState {
  const factory AdminState.loading() = AdminLoading;
  const factory AdminState.loaded(List<SubmissionEntity> submissions) = AdminLoaded;
  const factory AdminState.error(String message) = AdminError;
}
