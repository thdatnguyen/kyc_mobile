import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/auth_session.entity.dart';
import '../repositories/auth_repository.dart';

class RefreshUseCase {
  RefreshUseCase(this._repository);

  final AuthRepository _repository;

  Future<Either<Failure, AuthSession>> call(String refreshToken) =>
      _repository.refresh(refreshToken);
}
