// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Encrypted on-device cache of the in-progress KYC draft (PII). Mirrors the
/// server-side draft so a later offline-resume read can be added without
/// changing this seam.

@ProviderFor(draftStore)
final draftStoreProvider = DraftStoreProvider._();

/// Encrypted on-device cache of the in-progress KYC draft (PII). Mirrors the
/// server-side draft so a later offline-resume read can be added without
/// changing this seam.

final class DraftStoreProvider
    extends $FunctionalProvider<DraftStore, DraftStore, DraftStore>
    with $Provider<DraftStore> {
  /// Encrypted on-device cache of the in-progress KYC draft (PII). Mirrors the
  /// server-side draft so a later offline-resume read can be added without
  /// changing this seam.
  DraftStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'draftStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$draftStoreHash();

  @$internal
  @override
  $ProviderElement<DraftStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DraftStore create(Ref ref) {
    return draftStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DraftStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DraftStore>(value),
    );
  }
}

String _$draftStoreHash() => r'0980030b666dd2af679427c4b3fa77f801edf52e';
