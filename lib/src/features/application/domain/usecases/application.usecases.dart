import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/application.entities.dart';
import '../repositories/application_repository.dart';

class GetApplicationUseCase {
  GetApplicationUseCase(this._repository);
  final ApplicationRepository _repository;
  Future<Either<Failure, ApplicationEntity>> call() => _repository.getMyApplication();
}

class SaveStepUseCase {
  SaveStepUseCase(this._repository);
  final ApplicationRepository _repository;
  Future<Either<Failure, ApplicationEntity>> call(int step, Map<String, dynamic> data) =>
      _repository.saveStep(step, data);
}

class SubmitUseCase {
  SubmitUseCase(this._repository);
  final ApplicationRepository _repository;
  Future<Either<Failure, SubmitResult>> call() => _repository.submit();
}

class ResubmitUseCase {
  ResubmitUseCase(this._repository);
  final ApplicationRepository _repository;
  Future<Either<Failure, ApplicationEntity>> call() => _repository.resubmit();
}

class ListSubmissionsUseCase {
  ListSubmissionsUseCase(this._repository);
  final ApplicationRepository _repository;
  Future<Either<Failure, List<SubmissionEntity>>> call() => _repository.listSubmissions();
}

class UploadImageUseCase {
  UploadImageUseCase(this._repository);
  final ApplicationRepository _repository;
  Future<Either<Failure, String>> call({
    required List<int> bytes,
    required String filename,
    required String mimeType,
    required String kind,
  }) =>
      _repository.uploadImage(
        bytes: bytes,
        filename: filename,
        mimeType: mimeType,
        kind: kind,
      );
}
