import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/storage/session_store.dart';
import '../../domain/entities/user.entity.dart';
import '../../domain/providers.dart';
import '../state/auth.state.dart';

part 'auth.adapter.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() => const AuthState.initial();

  /// Clears a stale error so switching between Sign in / Register doesn't
  /// keep showing the previous failure.
  void clearError() => state = const AuthState.unauthenticated();

  /// Restore the session from encrypted storage on app start.
  Future<void> checkSession() async {
    final session = ref.read(sessionStoreProvider);
    final token = await session.readAccessToken();
    if (token == null || token.isEmpty) {
      state = const AuthState.unauthenticated();
      return;
    }
    final user = await session.readUser();
    state = AuthState.authenticated(
      UserEntity(
        id: user?.id ?? '',
        email: user?.email ?? '',
        role: user?.role ?? 'Applicant',
      ),
    );
  }

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();
    final result =
        await ref.read(loginUseCaseProvider).call(email: email, password: password);
    result.fold(
      (failure) => state = AuthState.error(failure.message),
      (session) => state = AuthState.authenticated(session.user),
    );
  }

  Future<void> register(String email, String password) async {
    state = const AuthState.loading();
    final result =
        await ref.read(registerUseCaseProvider).call(email: email, password: password);
    result.fold(
      (failure) => state = AuthState.error(failure.message),
      (session) => state = AuthState.authenticated(session.user),
    );
  }

  Future<void> logout() async {
    final result = await ref.read(logoutUseCaseProvider).call();
    result.fold(
      (failure) => state = AuthState.error(failure.message),
      (_) => state = const AuthState.unauthenticated(),
    );
  }
}
