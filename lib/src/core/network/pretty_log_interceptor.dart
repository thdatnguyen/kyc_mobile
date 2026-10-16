import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Pretty-prints dio traffic for debugging: colour-coded method/status,
/// indented JSON bodies, redacted secrets, and per-request duration.
/// Add in debug builds only (see `dioClient`).
class PrettyLogInterceptor extends Interceptor {
  static const _reset = '\x1B[0m';
  static const _bold = '\x1B[1m';
  static const _dim = '\x1B[2m';
  static const _cyan = '\x1B[36m';
  static const _green = '\x1B[32m';
  static const _red = '\x1B[31m';
  static const _yellow = '\x1B[33m';
  static const _magenta = '\x1B[35m';

  // Field names that must never appear in logs.
  static const _sensitive = ['password', 'token', 'secret', 'authorization', 'apikey', 'api_key'];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra['__logStart'] = DateTime.now();

    final b = StringBuffer()
      ..writeln('$_bold$_cyan┌ REQUEST$_reset')
      ..writeln('$_bold│ ${_methodColor(options.method)}${options.method}$_reset'
          '$_dim ${options.uri}$_reset');

    options.headers.forEach((key, value) {
      b.writeln('│ $_dim$key:$_reset ${_redact(key.toString(), value)}');
    });

    if (options.data != null) {
      b.writeln('│ $_dim body:$_reset');
      _writeBody(b, options.data);
    }

    b.writeln('$_bold$_cyan└─────────$_reset');
    debugPrint(b.toString());
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final status = response.statusCode ?? 0;
    final color = (status >= 200 && status < 300) ? _green : _red;
    final dur = _duration(response.requestOptions);

    final b = StringBuffer()
      ..writeln('$_bold$_magenta┌ RESPONSE$_reset')
      ..writeln('$_bold$color│ $status$_reset'
          '$_dim ${response.requestOptions.method} ${response.requestOptions.uri} · ${dur}ms$_reset');

    if (response.data != null) {
      b.writeln('│ $_dim body:$_reset');
      _writeBody(b, response.data);
    }

    b.writeln('$_bold$_magenta└──────────$_reset');
    debugPrint(b.toString());
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final status = err.response?.statusCode;
    final dur = _duration(err.requestOptions);

    final b = StringBuffer()
      ..writeln('$_bold$_red┌ ERROR$_reset')
      ..writeln('$_bold$_red│ ${status ?? '—'}$_reset'
          '$_dim ${err.requestOptions.method} ${err.requestOptions.uri} · ${dur}ms$_reset')
      ..writeln('$_red│ ${err.type.name}: ${err.message}$_reset');

    if (err.response?.data != null) {
      b.writeln('│ $_dim body:$_reset');
      _writeBody(b, err.response!.data);
    }

    b.writeln('$_bold$_red└───────$_reset');
    debugPrint(b.toString());
    handler.next(err);
  }

  int _duration(RequestOptions options) {
    final start = options.extra['__logStart'];
    return start is DateTime ? DateTime.now().difference(start).inMilliseconds : 0;
  }

  String _methodColor(String method) => switch (method) {
        'GET' => _green,
        'POST' => _yellow,
        'PUT' || 'PATCH' => _magenta,
        'DELETE' => _red,
        _ => _cyan,
      };

  String _redact(String key, dynamic value) {
    final isSensitive = _sensitive.any((s) => key.toLowerCase().contains(s));
    return isSensitive ? '••••' : value.toString();
  }

  void _writeBody(StringBuffer b, dynamic data) {
    if (data is FormData) {
      b.writeln('│   <multipart/form-data>');
      return;
    }
    if (data is List<int> || data is Uint8List) {
      b.writeln('│   <bytes: ${(data as List).length} bytes>');
      return;
    }
    if (data is List && data.isNotEmpty && data.first is int) {
      b.writeln('│   <bytes: ${data.length} bytes>');
      return;
    }

    final json = (data is Map || data is List)
        ? const JsonEncoder.withIndent('  ').convert(_redactDeep(data))
        : data.toString();

    final lines = json.split('\n');
    if (lines.length > 200) {
      for (int i = 0; i < 100; i++) {
        b.writeln('│   ${lines[i]}');
      }
      b.writeln('│   ... [truncated ${lines.length - 100} lines] ...');
    } else {
      for (final line in lines) {
        b.writeln('│   $line');
      }
    }
  }

  dynamic _redactDeep(dynamic data) {
    if (data is Map) {
      return data.map((k, v) {
        final isSensitive = _sensitive.any((s) => k.toString().toLowerCase().contains(s));
        return MapEntry(k, isSensitive ? '••••' : _redactDeep(v));
      });
    }
    if (data is List) return data.map(_redactDeep).toList();
    return data;
  }
}
