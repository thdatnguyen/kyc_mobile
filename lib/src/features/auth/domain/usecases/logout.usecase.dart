import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../repositories/auth_repository.dart';

class LogoutUseCase {
  LogoutUseCase(this._repository);

  final AuthRepository _repository;

  Future<Either<Failure, Unit>> call() => _repository.logout();
}
