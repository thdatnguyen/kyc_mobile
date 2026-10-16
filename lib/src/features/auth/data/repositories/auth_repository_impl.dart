import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/guard.dart';
import '../../../../core/storage/session_store.dart';
import '../../domain/entities/auth_session.entity.dart';
import '../../domain/entities/user.entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remote, this._session);

  final AuthRemoteDataSource _remote;
  final SessionStore _session;

  @override
  Future<Either<Failure, AuthSession>> login({
    required String email,
    required String password,
  }) {
    return guard(() async {
      final data = await _remote.login(email, password);
      final session = _toSession(data);
      await _persistSession(session);
      return session;
    });
  }

  @override
  Future<Either<Failure, AuthSession>> register({
    required String email,
    required String password,
  }) {
    return guard(() async {
      final data = await _remote.register(email, password);
      final session = _toSession(data);
      await _persistSession(session);
      return session;
    });
  }

  @override
  Future<Either<Failure, AuthSession>> refresh(String refreshToken) {
    return guard(() async {
      final data = await _remote.refresh(refreshToken);
      final session = _toSession(data);
      await _persistSession(session);
      return session;
    });
  }

  @override
  Future<Either<Failure, Unit>> logout() {
    return guard(() async {
      await _remote.logout();
      await _session.clearTokens();
      await _session.clearUser();
      return unit;
    });
  }

  AuthSession _toSession(Map<String, dynamic> data) {
    return AuthSession(
      user: UserEntity.fromJson(data['user'] as Map<String, dynamic>),
      accessToken: data['token'] as String,
      refreshToken: data['refreshToken'] as String,
    );
  }

  Future<void> _persistSession(AuthSession session) async {
    await _session.writeTokens(
      accessToken: session.accessToken,
      refreshToken: session.refreshToken,
    );
    await _session.writeUser(
      (id: session.user.id, email: session.user.email, role: session.user.role),
    );
  }
}
