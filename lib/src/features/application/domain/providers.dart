import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/dio_client.dart';
import '../data/datasources/application_remote_data_source.dart';
import '../data/repositories/application_repository_impl.dart';
import 'repositories/application_repository.dart';
import 'usecases/application.usecases.dart';

part 'providers.g.dart';

@riverpod
ApplicationRemoteDataSource applicationRemoteDataSource(Ref ref) =>
    ApplicationRemoteDataSourceImpl(ref.watch(dioClientProvider));

@riverpod
ApplicationRepository applicationRepository(Ref ref) =>
    ApplicationRepositoryImpl(ref.watch(applicationRemoteDataSourceProvider));

@riverpod
GetApplicationUseCase getApplicationUseCase(Ref ref) =>
    GetApplicationUseCase(ref.watch(applicationRepositoryProvider));

@riverpod
SaveStepUseCase saveStepUseCase(Ref ref) =>
    SaveStepUseCase(ref.watch(applicationRepositoryProvider));

@riverpod
SubmitUseCase submitUseCase(Ref ref) =>
    SubmitUseCase(ref.watch(applicationRepositoryProvider));

@riverpod
ResubmitUseCase resubmitUseCase(Ref ref) =>
    ResubmitUseCase(ref.watch(applicationRepositoryProvider));

@riverpod
ListSubmissionsUseCase listSubmissionsUseCase(Ref ref) =>
    ListSubmissionsUseCase(ref.watch(applicationRepositoryProvider));

@riverpod
UploadImageUseCase uploadImageUseCase(Ref ref) =>
    UploadImageUseCase(ref.watch(applicationRepositoryProvider));
