import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'draft_store.g.dart';

/// Encrypted on-device cache of the in-progress KYC draft (PII). Mirrors the
/// server-side draft so a later offline-resume read can be added without
/// changing this seam.
@riverpod
DraftStore draftStore(Ref ref) => DraftStore();

class DraftStore {
  static const _draftKey = 'kyc_draft';

  final FlutterSecureStorage _storage;

  DraftStore([FlutterSecureStorage? storage])
      : _storage = storage ?? const FlutterSecureStorage();

  Future<String?> read() => _storage.read(key: _draftKey);
  Future<void> write(String json) => _storage.write(key: _draftKey, value: json);
  Future<void> clear() => _storage.delete(key: _draftKey);
}
