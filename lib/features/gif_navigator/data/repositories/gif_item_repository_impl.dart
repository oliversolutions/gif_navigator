import 'package:dartz/dartz.dart';
import 'package:gif_navigator/core/error/Exceptions.dart';
import 'package:gif_navigator/features/gif_navigator/domain/repositories/gif_item_repository.dart';
import '../../../../core/error/Failures.dart';
import '../../domain/entities/gif_item.dart';
import '../datasources/gif_item_remote_data_source.dart';

class GifItemRepositoryImpl implements GifItemRepository {
  final GifItemRemoteDataSource remoteDataSource;
  GifItemRepositoryImpl({
    required this.remoteDataSource
  });
  @override
  Future<Either<Failure, List<GifItem>>>? getGifItems(String query, String pagination) async {
    try {
      final gifItemsList = await remoteDataSource.getGifItems(query, pagination);
      return Right(gifItemsList!);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
