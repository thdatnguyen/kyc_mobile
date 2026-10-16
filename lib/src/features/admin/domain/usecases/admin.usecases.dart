import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../features/application/domain/entities/application.entities.dart';
import '../repositories/admin_repository.dart';

class ListPendingReviewsUseCase {
  ListPendingReviewsUseCase(this._repository);
  final AdminRepository _repository;
  Future<Either<Failure, List<SubmissionEntity>>> call() => _repository.listPending();
}

class ReviewSubmissionUseCase {
  ReviewSubmissionUseCase(this._repository);
  final AdminRepository _repository;
  Future<Either<Failure, SubmissionEntity>> call({
    required String submissionId,
    required String decision,
    List<String>? reasons,
  }) =>
      _repository.review(submissionId: submissionId, decision: decision, reasons: reasons);
}
