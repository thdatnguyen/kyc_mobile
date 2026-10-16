import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/auth_session.entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthSession>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthSession>> register({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthSession>> refresh(String refreshToken);

  Future<Either<Failure, Unit>> logout();
}
