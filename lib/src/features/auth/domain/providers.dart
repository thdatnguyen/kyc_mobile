import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/dio_client.dart';
import '../../../core/storage/session_store.dart';
import '../data/datasources/auth_remote_data_source.dart';
import '../data/datasources/auth_remote_data_source_impl.dart';
import '../data/repositories/auth_repository_impl.dart';
import 'repositories/auth_repository.dart';
import 'usecases/login.usecase.dart';
import 'usecases/logout.usecase.dart';
import 'usecases/refresh.usecase.dart';
import 'usecases/register.usecase.dart';

part 'providers.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) =>
    AuthRemoteDataSourceImpl(ref.watch(dioClientProvider));

@riverpod
AuthRepository authRepository(Ref ref) => AuthRepositoryImpl(
      ref.watch(authRemoteDataSourceProvider),
      ref.watch(sessionStoreProvider),
    );

@riverpod
LoginUseCase loginUseCase(Ref ref) => LoginUseCase(ref.watch(authRepositoryProvider));

@riverpod
RegisterUseCase registerUseCase(Ref ref) => RegisterUseCase(ref.watch(authRepositoryProvider));

@riverpod
RefreshUseCase refreshUseCase(Ref ref) => RefreshUseCase(ref.watch(authRepositoryProvider));

@riverpod
LogoutUseCase logoutUseCase(Ref ref) => LogoutUseCase(ref.watch(authRepositoryProvider));
