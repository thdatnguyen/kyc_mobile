import 'package:dio/dio.dart';

import '../failure/failure.dart';

/// Maps a DioException (and the backend's `{ success, message }` envelope) to a
/// domain `Failure`.
Failure mapDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
      return const NetworkFailure();
    default:
      break;
  }

  final status = e.response?.statusCode;
  final message = _extractMessage(e);

  switch (status) {
    case 400:
      return ValidationFailure(message);
    case 401:
      return AuthFailure(message);
    case 403:
      return AuthFailure(message);
    case 404:
      return NotFoundFailure(message);
    case 409:
      return ConflictFailure(message);
    case 429:
      return RateLimitFailure(message);
    default:
      return ServerFailure(message);
  }
}

String _extractMessage(DioException e) {
  final data = e.response?.data;
  if (data is Map && data['message'] is String) {
    return data['message'] as String;
  }
  return 'Something went wrong. Please try again.';
}
