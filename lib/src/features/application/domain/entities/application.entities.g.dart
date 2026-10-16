// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersonalDetailsEntity _$PersonalDetailsEntityFromJson(
  Map<String, dynamic> json,
) => _PersonalDetailsEntity(
  fullName: json['fullName'] as String?,
  dateOfBirth: json['dateOfBirth'] as String?,
  nationality: json['nationality'] as String?,
  address: json['address'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$PersonalDetailsEntityToJson(
  _PersonalDetailsEntity instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'dateOfBirth': instance.dateOfBirth,
  'nationality': instance.nationality,
  'address': instance.address,
  'phone': instance.phone,
};

_DocumentInfoEntity _$DocumentInfoEntityFromJson(Map<String, dynamic> json) =>
    _DocumentInfoEntity(
      type: json['type'] as String?,
      documentNumber: json['documentNumber'] as String?,
      fullName: json['fullName'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      expiryDate: json['expiryDate'] as String?,
      imagePublicId: json['imagePublicId'] as String?,
    );

Map<String, dynamic> _$DocumentInfoEntityToJson(_DocumentInfoEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'documentNumber': instance.documentNumber,
      'fullName': instance.fullName,
      'dateOfBirth': instance.dateOfBirth,
      'expiryDate': instance.expiryDate,
      'imagePublicId': instance.imagePublicId,
    };

_LivenessInfo _$LivenessInfoFromJson(Map<String, dynamic> json) =>
    _LivenessInfo(
      passed: json['passed'] as bool,
      method: json['method'] as String,
    );

Map<String, dynamic> _$LivenessInfoToJson(_LivenessInfo instance) =>
    <String, dynamic>{'passed': instance.passed, 'method': instance.method};

_SelfieEntity _$SelfieEntityFromJson(Map<String, dynamic> json) =>
    _SelfieEntity(
      imagePublicId: json['imagePublicId'] as String?,
      liveness: json['liveness'] == null
          ? null
          : LivenessInfo.fromJson(json['liveness'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SelfieEntityToJson(_SelfieEntity instance) =>
    <String, dynamic>{
      'imagePublicId': instance.imagePublicId,
      'liveness': instance.liveness,
    };

_CheckResultEntity _$CheckResultEntityFromJson(Map<String, dynamic> json) =>
    _CheckResultEntity(
      name: json['name'] as String,
      passed: json['passed'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CheckResultEntityToJson(_CheckResultEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'passed': instance.passed,
      'message': instance.message,
    };

_FaceMatchEntity _$FaceMatchEntityFromJson(Map<String, dynamic> json) =>
    _FaceMatchEntity(
      modelLoaded: json['modelLoaded'] as bool,
      matched: json['matched'] as bool?,
      similarity: (json['similarity'] as num?)?.toDouble(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$FaceMatchEntityToJson(_FaceMatchEntity instance) =>
    <String, dynamic>{
      'modelLoaded': instance.modelLoaded,
      'matched': instance.matched,
      'similarity': instance.similarity,
      'error': instance.error,
    };

_AdminReviewEntity _$AdminReviewEntityFromJson(Map<String, dynamic> json) =>
    _AdminReviewEntity(
      decision: json['decision'] as String?,
      reasons: (json['reasons'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      decidedAt: json['decidedAt'] as String?,
    );

Map<String, dynamic> _$AdminReviewEntityToJson(_AdminReviewEntity instance) =>
    <String, dynamic>{
      'decision': instance.decision,
      'reasons': instance.reasons,
      'decidedAt': instance.decidedAt,
    };

_SubmissionEntity _$SubmissionEntityFromJson(
  Map<String, dynamic> json,
) => _SubmissionEntity(
  id: json['id'] as String,
  version: (json['version'] as num).toInt(),
  result: json['result'] as String,
  checks: (json['checks'] as List<dynamic>?)
      ?.map((e) => CheckResultEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
  faceMatch: json['faceMatch'] == null
      ? null
      : FaceMatchEntity.fromJson(json['faceMatch'] as Map<String, dynamic>),
  personalDetails: json['personalDetails'] == null
      ? null
      : PersonalDetailsEntity.fromJson(
          json['personalDetails'] as Map<String, dynamic>,
        ),
  document: json['document'] == null
      ? null
      : DocumentInfoEntity.fromJson(json['document'] as Map<String, dynamic>),
  selfie: json['selfie'] == null
      ? null
      : SelfieEntity.fromJson(json['selfie'] as Map<String, dynamic>),
  adminReview: json['adminReview'] == null
      ? null
      : AdminReviewEntity.fromJson(json['adminReview'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SubmissionEntityToJson(_SubmissionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'result': instance.result,
      'checks': instance.checks,
      'faceMatch': instance.faceMatch,
      'personalDetails': instance.personalDetails,
      'document': instance.document,
      'selfie': instance.selfie,
      'adminReview': instance.adminReview,
    };

_DraftEntity _$DraftEntityFromJson(Map<String, dynamic> json) => _DraftEntity(
  personalDetails: json['personalDetails'] == null
      ? null
      : PersonalDetailsEntity.fromJson(
          json['personalDetails'] as Map<String, dynamic>,
        ),
  document: json['document'] == null
      ? null
      : DocumentInfoEntity.fromJson(json['document'] as Map<String, dynamic>),
  selfie: json['selfie'] == null
      ? null
      : SelfieEntity.fromJson(json['selfie'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DraftEntityToJson(_DraftEntity instance) =>
    <String, dynamic>{
      'personalDetails': instance.personalDetails,
      'document': instance.document,
      'selfie': instance.selfie,
    };

_ApplicationEntity _$ApplicationEntityFromJson(Map<String, dynamic> json) =>
    _ApplicationEntity(
      id: json['id'] as String,
      status: json['status'] as String,
      currentStep: (json['currentStep'] as num).toInt(),
      draft: json['draft'] == null
          ? null
          : DraftEntity.fromJson(json['draft'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApplicationEntityToJson(_ApplicationEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'currentStep': instance.currentStep,
      'draft': instance.draft,
    };

_SubmitResult _$SubmitResultFromJson(Map<String, dynamic> json) =>
    _SubmitResult(
      application: ApplicationEntity.fromJson(
        json['application'] as Map<String, dynamic>,
      ),
      submission: SubmissionEntity.fromJson(
        json['submission'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SubmitResultToJson(_SubmitResult instance) =>
    <String, dynamic>{
      'application': instance.application,
      'submission': instance.submission,
    };
