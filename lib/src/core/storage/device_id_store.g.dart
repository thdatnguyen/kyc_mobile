// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_id_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Stable per-install device identifier, sent as `X-Device-Id` on every
/// request (a fraud/consistency signal, not a secret).

@ProviderFor(deviceIdStore)
final deviceIdStoreProvider = DeviceIdStoreProvider._();

/// Stable per-install device identifier, sent as `X-Device-Id` on every
/// request (a fraud/consistency signal, not a secret).

final class DeviceIdStoreProvider
    extends $FunctionalProvider<DeviceIdStore, DeviceIdStore, DeviceIdStore>
    with $Provider<DeviceIdStore> {
  /// Stable per-install device identifier, sent as `X-Device-Id` on every
  /// request (a fraud/consistency signal, not a secret).
  DeviceIdStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceIdStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceIdStoreHash();

  @$internal
  @override
  $ProviderElement<DeviceIdStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeviceIdStore create(Ref ref) {
    return deviceIdStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceIdStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceIdStore>(value),
    );
  }
}

String _$deviceIdStoreHash() => r'87fe258c3e1f2f162c13293e15069a371c16d6a9';
