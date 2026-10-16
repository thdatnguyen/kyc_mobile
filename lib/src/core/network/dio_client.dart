import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../config/env.dart';
import '../storage/device_id_store.dart';
import '../storage/session_store.dart';
import 'pretty_log_interceptor.dart';

part 'dio_client.g.dart';

@riverpod
Dio dioClient(Ref ref) {
  final session = ref.watch(sessionStoreProvider);
  final deviceId = ref.watch(deviceIdStoreProvider);
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      contentType: 'application/json',
    ),
  );
  dio.interceptors.add(AuthInterceptor(session, deviceId));
  // Pretty-print API traffic in debug builds only (tree-shaken in release).
  if (kDebugMode) {
    dio.interceptors.add(PrettyLogInterceptor());
  }
  return dio;
}

/// Injects the JWT + client/device headers, and transparently refreshes the
/// access token once on a 401 (single-flight via QueuedInterceptorsWrapper).
class AuthInterceptor extends QueuedInterceptorsWrapper {
  AuthInterceptor(this._session, this._deviceId);

  final SessionStore _session;
  final DeviceIdStore _deviceId;
  final Dio _bare = Dio(); // no interceptors — used for the refresh call itself

  String? _cachedAppVersion;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _session.readAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['X-Request-Id'] = const Uuid().v4();
    options.headers['X-Device-Id'] = await _deviceId.getOrCreate();
    options.headers['X-App-Version'] = await _appVersion();
    options.headers['X-Device-OS'] = Platform.operatingSystem;
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final opts = err.requestOptions;
    final alreadyRetried = opts.extra['retried'] == true;
    final isAuthPath = opts.path.contains('/auth/');

    if (err.response?.statusCode == 401 && !alreadyRetried && !isAuthPath) {
      final refreshed = await _tryRefresh();
      if (refreshed) {
        opts.extra['retried'] = true;
        opts.headers['Authorization'] = 'Bearer ${await _session.readAccessToken()}';
        try {
          final response = await _bare.fetch<dynamic>(opts);
          return handler.resolve(response);
        } on DioException catch (e) {
          return handler.next(e);
        }
      }
    }
    handler.next(err);
  }

  Future<bool> _tryRefresh() async {
    final refreshToken = await _session.readRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) return false;
    try {
      final res = await _bare.post(
        '${Env.apiBaseUrl}/api/auth/refresh',
        data: {'refreshToken': refreshToken},
      );
      final data = res.data['data'] as Map<String, dynamic>;
      await _session.writeTokens(
        accessToken: data['token'] as String,
        refreshToken: data['refreshToken'] as String,
      );
      return true;
    } catch (_) {
      await _session.clearTokens();
      return false;
    }
  }

  Future<String> _appVersion() async {
    _cachedAppVersion ??= (await PackageInfo.fromPlatform()).version;
    return _cachedAppVersion!;
  }
}
