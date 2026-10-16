import 'package:freezed_annotation/freezed_annotation.dart';

part 'application.entities.freezed.dart';
part 'application.entities.g.dart';

@freezed
abstract class PersonalDetailsEntity with _$PersonalDetailsEntity {
  const factory PersonalDetailsEntity({
    String? fullName,
    String? dateOfBirth,
    String? nationality,
    String? address,
    String? phone,
  }) = _PersonalDetailsEntity;

  factory PersonalDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$PersonalDetailsEntityFromJson(json);
}

@freezed
abstract class DocumentInfoEntity with _$DocumentInfoEntity {
  const factory DocumentInfoEntity({
    String? type,
    String? documentNumber,
    String? fullName,
    String? dateOfBirth,
    String? expiryDate,
    String? imagePublicId,
  }) = _DocumentInfoEntity;

  factory DocumentInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$DocumentInfoEntityFromJson(json);
}

@freezed
abstract class LivenessInfo with _$LivenessInfo {
  const factory LivenessInfo({required bool passed, required String method}) =
      _LivenessInfo;

  factory LivenessInfo.fromJson(Map<String, dynamic> json) =>
      _$LivenessInfoFromJson(json);
}

@freezed
abstract class SelfieEntity with _$SelfieEntity {
  const factory SelfieEntity({
    String? imagePublicId,
    LivenessInfo? liveness,
  }) = _SelfieEntity;

  factory SelfieEntity.fromJson(Map<String, dynamic> json) =>
      _$SelfieEntityFromJson(json);
}

@freezed
abstract class CheckResultEntity with _$CheckResultEntity {
  const factory CheckResultEntity({
    required String name,
    required bool passed,
    String? message,
  }) = _CheckResultEntity;

  factory CheckResultEntity.fromJson(Map<String, dynamic> json) =>
      _$CheckResultEntityFromJson(json);
}

@freezed
abstract class FaceMatchEntity with _$FaceMatchEntity {
  const factory FaceMatchEntity({
    required bool modelLoaded,
    bool? matched,
    double? similarity,
    String? error,
  }) = _FaceMatchEntity;

  factory FaceMatchEntity.fromJson(Map<String, dynamic> json) =>
      _$FaceMatchEntityFromJson(json);
}

@freezed
abstract class AdminReviewEntity with _$AdminReviewEntity {
  const factory AdminReviewEntity({
    String? decision,
    List<String>? reasons,
    String? decidedAt,
  }) = _AdminReviewEntity;

  factory AdminReviewEntity.fromJson(Map<String, dynamic> json) =>
      _$AdminReviewEntityFromJson(json);
}

@freezed
abstract class SubmissionEntity with _$SubmissionEntity {
  const factory SubmissionEntity({
    required String id,
    required int version,
    required String result,
    List<CheckResultEntity>? checks,
    FaceMatchEntity? faceMatch,
    PersonalDetailsEntity? personalDetails,
    DocumentInfoEntity? document,
    SelfieEntity? selfie,
    AdminReviewEntity? adminReview,
  }) = _SubmissionEntity;

  factory SubmissionEntity.fromJson(Map<String, dynamic> json) =>
      _$SubmissionEntityFromJson(json);
}

@freezed
abstract class DraftEntity with _$DraftEntity {
  const factory DraftEntity({
    PersonalDetailsEntity? personalDetails,
    DocumentInfoEntity? document,
    SelfieEntity? selfie,
  }) = _DraftEntity;

  factory DraftEntity.fromJson(Map<String, dynamic> json) =>
      _$DraftEntityFromJson(json);
}

@freezed
abstract class ApplicationEntity with _$ApplicationEntity {
  const factory ApplicationEntity({
    required String id,
    required String status,
    required int currentStep,
    DraftEntity? draft,
  }) = _ApplicationEntity;

  factory ApplicationEntity.fromJson(Map<String, dynamic> json) =>
      _$ApplicationEntityFromJson(json);
}

@freezed
abstract class SubmitResult with _$SubmitResult {
  const factory SubmitResult({
    required ApplicationEntity application,
    required SubmissionEntity submission,
  }) = _SubmitResult;

  factory SubmitResult.fromJson(Map<String, dynamic> json) =>
      _$SubmitResultFromJson(json);
}
