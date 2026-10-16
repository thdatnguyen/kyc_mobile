import 'package:dio/dio.dart';

abstract class AdminRemoteDataSource {
  Future<Map<String, dynamic>> listPending(int skip, int top);

  Future<Map<String, dynamic>> review(
    String id,
    String decision,
    List<String>? reasons,
  );
}

class AdminRemoteDataSourceImpl implements AdminRemoteDataSource {
  AdminRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<Map<String, dynamic>> listPending(int skip, int top) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/api/admin/reviews',
      queryParameters: {'skip': skip, 'top': top},
    );
    return res.data!['data'] as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> review(
    String id,
    String decision,
    List<String>? reasons,
  ) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/api/admin/reviews/$id',
      data: {'decision': decision, 'reasons': reasons},
    );
    return res.data!['data'] as Map<String, dynamic>;
  }
}
