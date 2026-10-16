import 'package:dio/dio.dart';

abstract class ApplicationRemoteDataSource {
  Future<Map<String, dynamic>> getMyApplication();

  Future<Map<String, dynamic>> saveStep(int step, Map<String, dynamic> data);

  Future<Map<String, dynamic>> submit();

  Future<Map<String, dynamic>> resubmit();

  Future<List<dynamic>> listSubmissions();

  Future<Map<String, dynamic>> uploadImage({
    required List<int> bytes,
    required String filename,
    required String mimeType,
    required String kind,
  });
}

class ApplicationRemoteDataSourceImpl implements ApplicationRemoteDataSource {
  ApplicationRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<Map<String, dynamic>> getMyApplication() async {
    final res = await _dio.get<Map<String, dynamic>>('/api/applications/me');
    return res.data!['data'] as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> saveStep(int step, Map<String, dynamic> data) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/api/applications/me/step',
      data: {'step': step, 'data': data},
    );
    return res.data!['data'] as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> submit() async {
    final res = await _dio.post<Map<String, dynamic>>('/api/applications/me/submit');
    return res.data!['data'] as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> resubmit() async {
    final res = await _dio.post<Map<String, dynamic>>('/api/applications/me/resubmit');
    return res.data!['data'] as Map<String, dynamic>;
  }

  @override
  Future<List<dynamic>> listSubmissions() async {
    final res = await _dio.get<Map<String, dynamic>>('/api/applications/me/submissions');
    return res.data!['data'] as List<dynamic>;
  }

  @override
  Future<Map<String, dynamic>> uploadImage({
    required List<int> bytes,
    required String filename,
    required String mimeType,
    required String kind,
  }) async {
    final form = FormData.fromMap({
      'kind': kind,
      'image': MultipartFile.fromBytes(bytes, filename: filename, contentType: DioMediaType.parse(mimeType)),
    });
    final res = await _dio.post<Map<String, dynamic>>('/api/upload', data: form);
    return res.data!['data'] as Map<String, dynamic>;
  }
}
