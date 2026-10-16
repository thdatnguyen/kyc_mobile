import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/application.entities.dart';

abstract class ApplicationRepository {
  Future<Either<Failure, ApplicationEntity>> getMyApplication();

  Future<Either<Failure, ApplicationEntity>> saveStep(
    int step,
    Map<String, dynamic> data,
  );

  Future<Either<Failure, SubmitResult>> submit();

  Future<Either<Failure, ApplicationEntity>> resubmit();

  Future<Either<Failure, List<SubmissionEntity>>> listSubmissions();

  /// Uploads an image and returns its `publicId`.
  Future<Either<Failure, String>> uploadImage({
    required List<int> bytes,
    required String filename,
    required String mimeType,
    required String kind,
  });
}
