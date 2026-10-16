// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.adapter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AdminController)
final adminControllerProvider = AdminControllerProvider._();

final class AdminControllerProvider
    extends $NotifierProvider<AdminController, AdminState> {
  AdminControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adminControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$adminControllerHash();

  @$internal
  @override
  AdminController create() => AdminController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AdminState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AdminState>(value),
    );
  }
}

String _$adminControllerHash() => r'87754411b10c304eaec018c98a9f641f88b52505';

abstract class _$AdminController extends $Notifier<AdminState> {
  AdminState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AdminState, AdminState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AdminState, AdminState>,
              AdminState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
