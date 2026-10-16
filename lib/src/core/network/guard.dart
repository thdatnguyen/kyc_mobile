import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../failure/failure.dart';
import 'api_exception.dart';

/// Runs [fn] and maps any thrown exception to a domain [Failure], so a
/// repository adapter returns `Either<Failure, T>` without repeating the
/// try/catch + `mapDioException` idiom in every method.
Future<Either<Failure, T>> guard<T>(Future<T> Function() fn) async {
  try {
    return Right(await fn());
  } on DioException catch (e) {
    return Left(mapDioException(e));
  } catch (_) {
    return const Left(ServerFailure('Unexpected error'));
  }
}
