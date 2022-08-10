import 'package:dartz/dartz.dart';
import 'package:gif_navigator/features/gif_navigator/domain/entities/gif_item.dart';
import 'package:gif_navigator/features/gif_navigator/domain/repositories/gif_item_repository.dart';
import '../../../../core/error/Failures.dart';

class GetGifItems {
  final GifItemRepository repository;
  GetGifItems(this.repository);
  Future<Either<Failure, List<GifItem>>?> call(String query, String pagination) async {
    return await repository.getGifItems(query, pagination);
  }
}
