// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ml_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// On-device ML Kit helpers (OCR + QR scanning + face detection).

@ProviderFor(mlService)
final mlServiceProvider = MlServiceProvider._();

/// On-device ML Kit helpers (OCR + QR scanning + face detection).

final class MlServiceProvider
    extends $FunctionalProvider<MlService, MlService, MlService>
    with $Provider<MlService> {
  /// On-device ML Kit helpers (OCR + QR scanning + face detection).
  MlServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mlServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mlServiceHash();

  @$internal
  @override
  $ProviderElement<MlService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MlService create(Ref ref) {
    return mlService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MlService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MlService>(value),
    );
  }
}

String _$mlServiceHash() => r'1b0d98bcb36fe3a3a7813e9012ac8e1bd1061504';
