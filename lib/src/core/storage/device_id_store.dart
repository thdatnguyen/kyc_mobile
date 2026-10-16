import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_id_store.g.dart';

/// Stable per-install device identifier, sent as `X-Device-Id` on every
/// request (a fraud/consistency signal, not a secret).
@riverpod
DeviceIdStore deviceIdStore(Ref ref) => DeviceIdStore();

class DeviceIdStore {
  static const _deviceIdKey = 'device_id';

  final FlutterSecureStorage _storage;

  DeviceIdStore([FlutterSecureStorage? storage])
      : _storage = storage ?? const FlutterSecureStorage();

  Future<String> getOrCreate() async {
    final existing = await _storage.read(key: _deviceIdKey);
    if (existing != null && existing.isNotEmpty) return existing;
    final id = DateTime.now().microsecondsSinceEpoch.toString();
    await _storage.write(key: _deviceIdKey, value: id);
    return id;
  }
}
