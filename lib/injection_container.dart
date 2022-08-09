import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gif_navigator/features/gif_navigator/data/datasources/GifItemRemoteDataSource.dart';
import 'package:gif_navigator/features/gif_navigator/domain/repositories/GifItemRepository.dart';
import 'package:gif_navigator/features/login/data/datasources/UserLocalDataSource.dart';
import 'package:gif_navigator/features/login/domain/usescases/Login.dart';

import 'features/gif_navigator/data/datasources/RestClient.dart';
import 'features/gif_navigator/data/repositories/GifItemRepositoryImpl.dart';
import 'features/gif_navigator/domain/usescases/GetGifItems.dart';
import 'features/gif_navigator/presentation/bloc/gif_items_bloc.dart';
import 'features/login/data/datasources/UserGenerator.dart';
import 'features/login/data/repositories/UserRepositoryImpl.dart';
import 'features/login/domain/repositories/UserRepository.dart';
import 'features/login/presentation/bloc/user_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => GifItemsBloc(
      getGifItems: sl(),
    ),
  );
  sl.registerFactory(
    () => UserBloc(
      login: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetGifItems(sl()));
  sl.registerLazySingleton(() => Login(sl()));

  // Repository
  sl.registerLazySingleton<GifItemRepository>(
    () => GifItemRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GifItemRemoteDataSource>(
    () => GifItemRemoteDataSourceImpl(restClient: sl()),
  );
  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(userGenerator: sl()),
  );

  // Others
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => RestClient(sl()));
  sl.registerLazySingleton(() => UserGenerator());
}
