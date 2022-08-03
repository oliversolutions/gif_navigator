import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gif_navigator/features/gif_navigator/data/datasources/GifItemRemoteDataSource.dart';
import 'package:gif_navigator/features/gif_navigator/domain/repositories/GifItemRepository.dart';

import 'features/gif_navigator/data/datasources/RestClient.dart';
import 'features/gif_navigator/data/repositories/GifItemRepositoryImpl.dart';
import 'features/gif_navigator/domain/usescases/GetGifItems.dart';
import 'features/gif_navigator/presentation/bloc/gif_items_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => GifItemsBloc(
      getGifItems: sl(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(() => GetGifItems(sl()));

  // Repository
  sl.registerLazySingleton<GifItemRepository>(
    () => GifItemRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<GifItemRemoteDataSource>(
    () => GifItemRemoteDataSourceImpl(restClient: sl()),
  );

  // API Client
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => RestClient(sl()));
}
