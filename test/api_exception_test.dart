import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kyc_mobile/src/core/failure/failure.dart';
import 'package:kyc_mobile/src/core/network/api_exception.dart';

void main() {
  test('maps 429 to RateLimitFailure with the backend message', () {
    final e = DioException(
      requestOptions: RequestOptions(path: '/x'),
      response: Response(
        requestOptions: RequestOptions(path: '/x'),
        statusCode: 429,
        data: {'message': 'Too many requests'},
      ),
    );
    final f = mapDioException(e);
    expect(f, isA<RateLimitFailure>());
    expect(f.message, 'Too many requests');
  });

  test('maps 401 to AuthFailure', () {
    final e = DioException(
      requestOptions: RequestOptions(path: '/x'),
      response: Response(
        requestOptions: RequestOptions(path: '/x'),
        statusCode: 401,
        data: {'message': 'Invalid credentials'},
      ),
    );
    expect(mapDioException(e), isA<AuthFailure>());
  });

  test('maps connection errors to NetworkFailure', () {
    final e = DioException(
      requestOptions: RequestOptions(path: '/x'),
      type: DioExceptionType.connectionError,
    );
    expect(mapDioException(e), isA<NetworkFailure>());
  });

  test('maps unknown 500 to ServerFailure', () {
    final e = DioException(
      requestOptions: RequestOptions(path: '/x'),
      response: Response(
        requestOptions: RequestOptions(path: '/x'),
        statusCode: 500,
        data: {'message': 'Internal server error'},
      ),
    );
    expect(mapDioException(e), isA<ServerFailure>());
  });
}
