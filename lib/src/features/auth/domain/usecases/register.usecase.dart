import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/auth_session.entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  RegisterUseCase(this._repository);

  final AuthRepository _repository;

  Future<Either<Failure, AuthSession>> call({
    required String email,
    required String password,
  }) =>
      _repository.register(email: email, password: password);
}
