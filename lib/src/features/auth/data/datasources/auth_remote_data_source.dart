abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String email, String password);

  Future<Map<String, dynamic>> register(String email, String password);

  Future<Map<String, dynamic>> refresh(String refreshToken);

  Future<void> logout();
}
