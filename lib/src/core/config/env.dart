import 'package:flutter/foundation.dart';

/// Runtime configuration. Override `API_BASE_URL` via:
///   flutter run --dart-define=API_BASE_URL=https://kyc-api.up.railway.app
class Env {
  static const _fromEnv = String.fromEnvironment('API_BASE_URL');

  static String get apiBaseUrl {
    if (_fromEnv.isNotEmpty) return _fromEnv;
    // Release builds default to production Railway API domain
    if (kReleaseMode) return 'https://kyc-api.up.railway.app';
    // Android emulator reaches host machine via 10.0.2.2
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return 'https://kyc-api.up.railway.app';

    }
    return 'http://10.0.2.2:5001';
  }
}
