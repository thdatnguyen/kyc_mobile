import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/guard.dart';
import '../../domain/entities/application.entities.dart';
import '../../domain/repositories/application_repository.dart';
import '../datasources/application_remote_data_source.dart';

class ApplicationRepositoryImpl implements ApplicationRepository {
  ApplicationRepositoryImpl(this._remote);

  final ApplicationRemoteDataSource _remote;

  @override
  Future<Either<Failure, ApplicationEntity>> getMyApplication() {
    return guard(() async {
      final data = await _remote.getMyApplication();
      return ApplicationEntity.fromJson(data['application'] as Map<String, dynamic>);
    });
  }

  @override
  Future<Either<Failure, ApplicationEntity>> saveStep(
    int step,
    Map<String, dynamic> data,
  ) {
    return guard(() async {
      final res = await _remote.saveStep(step, data);
      return ApplicationEntity.fromJson(res);
    });
  }

  @override
  Future<Either<Failure, SubmitResult>> submit() {
    return guard(() async {
      final res = await _remote.submit();
      return SubmitResult.fromJson(res);
    });
  }

  @override
  Future<Either<Failure, ApplicationEntity>> resubmit() {
    return guard(() async {
      final res = await _remote.resubmit();
      return ApplicationEntity.fromJson(res);
    });
  }

  @override
  Future<Either<Failure, List<SubmissionEntity>>> listSubmissions() {
    return guard(() async {
      final list = await _remote.listSubmissions();
      return list
          .map((e) => SubmissionEntity.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<Either<Failure, String>> uploadImage({
    required List<int> bytes,
    required String filename,
    required String mimeType,
    required String kind,
  }) {
    return guard(() async {
      final res = await _remote.uploadImage(
        bytes: bytes,
        filename: filename,
        mimeType: mimeType,
        kind: kind,
      );
      return res['publicId'] as String;
    });
  }
}
