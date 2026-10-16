// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(adminRemoteDataSource)
final adminRemoteDataSourceProvider = AdminRemoteDataSourceProvider._();

final class AdminRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          AdminRemoteDataSource,
          AdminRemoteDataSource,
          AdminRemoteDataSource
        >
    with $Provider<AdminRemoteDataSource> {
  AdminRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adminRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$adminRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<AdminRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AdminRemoteDataSource create(Ref ref) {
    return adminRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AdminRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AdminRemoteDataSource>(value),
    );
  }
}

String _$adminRemoteDataSourceHash() =>
    r'029de043d00e5049794fffc1ff4ca3fe68228285';

@ProviderFor(adminRepository)
final adminRepositoryProvider = AdminRepositoryProvider._();

final class AdminRepositoryProvider
    extends
        $FunctionalProvider<AdminRepository, AdminRepository, AdminRepository>
    with $Provider<AdminRepository> {
  AdminRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adminRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$adminRepositoryHash();

  @$internal
  @override
  $ProviderElement<AdminRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AdminRepository create(Ref ref) {
    return adminRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AdminRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AdminRepository>(value),
    );
  }
}

String _$adminRepositoryHash() => r'5c5c755a3d72c2545edce3fc4e16c4390904350c';

@ProviderFor(listPendingReviewsUseCase)
final listPendingReviewsUseCaseProvider = ListPendingReviewsUseCaseProvider._();

final class ListPendingReviewsUseCaseProvider
    extends
        $FunctionalProvider<
          ListPendingReviewsUseCase,
          ListPendingReviewsUseCase,
          ListPendingReviewsUseCase
        >
    with $Provider<ListPendingReviewsUseCase> {
  ListPendingReviewsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listPendingReviewsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listPendingReviewsUseCaseHash();

  @$internal
  @override
  $ProviderElement<ListPendingReviewsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ListPendingReviewsUseCase create(Ref ref) {
    return listPendingReviewsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListPendingReviewsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListPendingReviewsUseCase>(value),
    );
  }
}

String _$listPendingReviewsUseCaseHash() =>
    r'3f67bec4834e2a180c7efebbb102656c9cd12889';

@ProviderFor(reviewSubmissionUseCase)
final reviewSubmissionUseCaseProvider = ReviewSubmissionUseCaseProvider._();

final class ReviewSubmissionUseCaseProvider
    extends
        $FunctionalProvider<
          ReviewSubmissionUseCase,
          ReviewSubmissionUseCase,
          ReviewSubmissionUseCase
        >
    with $Provider<ReviewSubmissionUseCase> {
  ReviewSubmissionUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reviewSubmissionUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reviewSubmissionUseCaseHash();

  @$internal
  @override
  $ProviderElement<ReviewSubmissionUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReviewSubmissionUseCase create(Ref ref) {
    return reviewSubmissionUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReviewSubmissionUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReviewSubmissionUseCase>(value),
    );
  }
}

String _$reviewSubmissionUseCaseHash() =>
    r'86fd100590f657179b6df7959a7a29c4deaf4889';
