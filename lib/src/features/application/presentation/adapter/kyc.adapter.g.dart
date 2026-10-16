// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc.adapter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(KycController)
final kycControllerProvider = KycControllerProvider._();

final class KycControllerProvider
    extends $NotifierProvider<KycController, KycState> {
  KycControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'kycControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$kycControllerHash();

  @$internal
  @override
  KycController create() => KycController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KycState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KycState>(value),
    );
  }
}

String _$kycControllerHash() => r'ad5eaaa4185da14b0fd779cb26c99859c51e81cf';

abstract class _$KycController extends $Notifier<KycState> {
  KycState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<KycState, KycState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<KycState, KycState>,
              KycState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
