import 'package:dio/dio.dart';

import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/api/auth/login',
      data: {'email': email, 'password': password},
    );
    return res.data!['data'] as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> register(String email, String password) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/api/auth/register',
      data: {'email': email, 'password': password},
    );
    return res.data!['data'] as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> refresh(String refreshToken) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/api/auth/refresh',
      data: {'refreshToken': refreshToken},
    );
    return res.data!['data'] as Map<String, dynamic>;
  }

  @override
  Future<void> logout() async {
    await _dio.post<void>('/api/auth/logout');
  }
}
