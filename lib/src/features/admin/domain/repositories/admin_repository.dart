import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../features/application/domain/entities/application.entities.dart';

abstract class AdminRepository {
  Future<Either<Failure, List<SubmissionEntity>>> listPending();

  Future<Either<Failure, SubmissionEntity>> review({
    required String submissionId,
    required String decision,
    List<String>? reasons,
  });
}
