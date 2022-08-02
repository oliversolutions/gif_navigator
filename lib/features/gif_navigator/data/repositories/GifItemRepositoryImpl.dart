import 'package:dartz/dartz.dart';
import 'package:gif_navigator/features/gif_navigator/data/datasources/GifItemRemoteDataSource.dart';
import 'package:gif_navigator/features/gif_navigator/domain/repositories/GifItemRepository.dart';
import '../../../../core/error/Failures.dart';
import '../../domain/entities/GifItem.dart';

class GifItemRepositoryImpl implements GifItemRepository {
  final GifItemRemoteDataSource remoteDataSource;
  GifItemRepositoryImpl({
    required this.remoteDataSource
  });
  @override
  Future<Either<Failure, List<GifItem>>>? getGifItems() {
    return null;
  }
}
