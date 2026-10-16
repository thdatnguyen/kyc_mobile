// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(applicationRemoteDataSource)
final applicationRemoteDataSourceProvider =
    ApplicationRemoteDataSourceProvider._();

final class ApplicationRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ApplicationRemoteDataSource,
          ApplicationRemoteDataSource,
          ApplicationRemoteDataSource
        >
    with $Provider<ApplicationRemoteDataSource> {
  ApplicationRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'applicationRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$applicationRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ApplicationRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ApplicationRemoteDataSource create(Ref ref) {
    return applicationRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApplicationRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApplicationRemoteDataSource>(value),
    );
  }
}

String _$applicationRemoteDataSourceHash() =>
    r'02317485d9fc74750786a61efcb2af1d9b94df2d';

@ProviderFor(applicationRepository)
final applicationRepositoryProvider = ApplicationRepositoryProvider._();

final class ApplicationRepositoryProvider
    extends
        $FunctionalProvider<
          ApplicationRepository,
          ApplicationRepository,
          ApplicationRepository
        >
    with $Provider<ApplicationRepository> {
  ApplicationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'applicationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$applicationRepositoryHash();

  @$internal
  @override
  $ProviderElement<ApplicationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ApplicationRepository create(Ref ref) {
    return applicationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApplicationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApplicationRepository>(value),
    );
  }
}

String _$applicationRepositoryHash() =>
    r'fb17fa8cc19f59df85b42f4b5458825198a9470a';

@ProviderFor(getApplicationUseCase)
final getApplicationUseCaseProvider = GetApplicationUseCaseProvider._();

final class GetApplicationUseCaseProvider
    extends
        $FunctionalProvider<
          GetApplicationUseCase,
          GetApplicationUseCase,
          GetApplicationUseCase
        >
    with $Provider<GetApplicationUseCase> {
  GetApplicationUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getApplicationUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getApplicationUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetApplicationUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetApplicationUseCase create(Ref ref) {
    return getApplicationUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetApplicationUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetApplicationUseCase>(value),
    );
  }
}

String _$getApplicationUseCaseHash() =>
    r'cece3f1d2a41e043232df5a99c58f0277ae634ea';

@ProviderFor(saveStepUseCase)
final saveStepUseCaseProvider = SaveStepUseCaseProvider._();

final class SaveStepUseCaseProvider
    extends
        $FunctionalProvider<SaveStepUseCase, SaveStepUseCase, SaveStepUseCase>
    with $Provider<SaveStepUseCase> {
  SaveStepUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saveStepUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saveStepUseCaseHash();

  @$internal
  @override
  $ProviderElement<SaveStepUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SaveStepUseCase create(Ref ref) {
    return saveStepUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveStepUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveStepUseCase>(value),
    );
  }
}

String _$saveStepUseCaseHash() => r'400c8b5275a13dcc2fbd7b595ef86e0104a0d183';

@ProviderFor(submitUseCase)
final submitUseCaseProvider = SubmitUseCaseProvider._();

final class SubmitUseCaseProvider
    extends $FunctionalProvider<SubmitUseCase, SubmitUseCase, SubmitUseCase>
    with $Provider<SubmitUseCase> {
  SubmitUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submitUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$submitUseCaseHash();

  @$internal
  @override
  $ProviderElement<SubmitUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SubmitUseCase create(Ref ref) {
    return submitUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubmitUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubmitUseCase>(value),
    );
  }
}

String _$submitUseCaseHash() => r'b5af0f1bcafea34bbd16e71849fcb62b8525a679';

@ProviderFor(resubmitUseCase)
final resubmitUseCaseProvider = ResubmitUseCaseProvider._();

final class ResubmitUseCaseProvider
    extends
        $FunctionalProvider<ResubmitUseCase, ResubmitUseCase, ResubmitUseCase>
    with $Provider<ResubmitUseCase> {
  ResubmitUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resubmitUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resubmitUseCaseHash();

  @$internal
  @override
  $ProviderElement<ResubmitUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ResubmitUseCase create(Ref ref) {
    return resubmitUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResubmitUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResubmitUseCase>(value),
    );
  }
}

String _$resubmitUseCaseHash() => r'6a27b20897a82af74191fd130d1ed052ed46329d';

@ProviderFor(listSubmissionsUseCase)
final listSubmissionsUseCaseProvider = ListSubmissionsUseCaseProvider._();

final class ListSubmissionsUseCaseProvider
    extends
        $FunctionalProvider<
          ListSubmissionsUseCase,
          ListSubmissionsUseCase,
          ListSubmissionsUseCase
        >
    with $Provider<ListSubmissionsUseCase> {
  ListSubmissionsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listSubmissionsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listSubmissionsUseCaseHash();

  @$internal
  @override
  $ProviderElement<ListSubmissionsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ListSubmissionsUseCase create(Ref ref) {
    return listSubmissionsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListSubmissionsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListSubmissionsUseCase>(value),
    );
  }
}

String _$listSubmissionsUseCaseHash() =>
    r'ccfb2047d833992d94a6009b0651009b3791d3dc';

@ProviderFor(uploadImageUseCase)
final uploadImageUseCaseProvider = UploadImageUseCaseProvider._();

final class UploadImageUseCaseProvider
    extends
        $FunctionalProvider<
          UploadImageUseCase,
          UploadImageUseCase,
          UploadImageUseCase
        >
    with $Provider<UploadImageUseCase> {
  UploadImageUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uploadImageUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uploadImageUseCaseHash();

  @$internal
  @override
  $ProviderElement<UploadImageUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UploadImageUseCase create(Ref ref) {
    return uploadImageUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UploadImageUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UploadImageUseCase>(value),
    );
  }
}

String _$uploadImageUseCaseHash() =>
    r'72f4748dd80b66d2c51c69c62c7ad247f21d21f4';
