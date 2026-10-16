import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/dio_client.dart';
import '../data/datasources/admin_remote_data_source.dart';
import '../data/repositories/admin_repository_impl.dart';
import 'repositories/admin_repository.dart';
import 'usecases/admin.usecases.dart';

part 'providers.g.dart';

@riverpod
AdminRemoteDataSource adminRemoteDataSource(Ref ref) =>
    AdminRemoteDataSourceImpl(ref.watch(dioClientProvider));

@riverpod
AdminRepository adminRepository(Ref ref) =>
    AdminRepositoryImpl(ref.watch(adminRemoteDataSourceProvider));

@riverpod
ListPendingReviewsUseCase listPendingReviewsUseCase(Ref ref) =>
    ListPendingReviewsUseCase(ref.watch(adminRepositoryProvider));

@riverpod
ReviewSubmissionUseCase reviewSubmissionUseCase(Ref ref) =>
    ReviewSubmissionUseCase(ref.watch(adminRepositoryProvider));
