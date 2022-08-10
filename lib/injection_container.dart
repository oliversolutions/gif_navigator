import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gif_navigator/features/gif_navigator/data/datasources/gif_item_remote_data_source.dart';
import 'package:gif_navigator/features/gif_navigator/domain/repositories/gif_item_repository.dart';
import 'package:gif_navigator/features/login/data/datasources/user_local_data_source.dart';
import 'package:gif_navigator/features/login/domain/usescases/login.dart';

import 'features/gif_navigator/data/datasources/rest_client.dart';
import 'features/gif_navigator/data/repositories/gif_item_repository_impl.dart';
import 'features/gif_navigator/domain/usescases/get_gif_items.dart';
import 'features/gif_navigator/presentation/bloc/gif_items_bloc.dart';
import 'features/login/data/datasources/user_generator.dart';
import 'features/login/data/repositories/user_repository_impl.dart';
import 'features/login/domain/repositories/user_repository.dart';
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
