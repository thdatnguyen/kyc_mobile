import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/guard.dart';
import '../../../application/domain/entities/application.entities.dart';
import '../../domain/repositories/admin_repository.dart';
import '../datasources/admin_remote_data_source.dart';

class AdminRepositoryImpl implements AdminRepository {
  AdminRepositoryImpl(this._remote);

  final AdminRemoteDataSource _remote;

  @override
  Future<Either<Failure, List<SubmissionEntity>>> listPending() {
    return guard(() async {
      final data = await _remote.listPending(0, 100);
      final list = data['submissions'] as List;
      return list
          .map((e) => SubmissionEntity.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<Either<Failure, SubmissionEntity>> review({
    required String submissionId,
    required String decision,
    List<String>? reasons,
  }) {
    return guard(() async {
      final res = await _remote.review(submissionId, decision, reasons);
      return SubmissionEntity.fromJson(res);
    });
  }
}
