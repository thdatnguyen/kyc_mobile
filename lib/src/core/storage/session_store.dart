import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_store.g.dart';

typedef StoredUser = ({String id, String email, String role});

/// Encrypted auth-session persistence (tokens + identity). One concern per
/// module — this one owns everything about the signed-in session.
@riverpod
SessionStore sessionStore(Ref ref) => SessionStore();

class SessionStore {
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _userIdKey = 'user_id';
  static const _userEmailKey = 'user_email';
  static const _userRoleKey = 'user_role';

  final FlutterSecureStorage _storage;

  SessionStore([FlutterSecureStorage? storage])
      : _storage = storage ?? const FlutterSecureStorage();

  Future<String?> readAccessToken() => _storage.read(key: _accessTokenKey);
  Future<String?> readRefreshToken() => _storage.read(key: _refreshTokenKey);

  Future<void> writeTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<void> clearTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }

  Future<StoredUser?> readUser() async {
    final id = await _storage.read(key: _userIdKey);
    final email = await _storage.read(key: _userEmailKey);
    final role = await _storage.read(key: _userRoleKey);
    if (id == null || email == null || role == null) return null;
    return (id: id, email: email, role: role);
  }

  Future<void> writeUser(StoredUser user) async {
    await _storage.write(key: _userIdKey, value: user.id);
    await _storage.write(key: _userEmailKey, value: user.email);
    await _storage.write(key: _userRoleKey, value: user.role);
  }

  Future<void> clearUser() async {
    await _storage.delete(key: _userIdKey);
    await _storage.delete(key: _userEmailKey);
    await _storage.delete(key: _userRoleKey);
  }
}
