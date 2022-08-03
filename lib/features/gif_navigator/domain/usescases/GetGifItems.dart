import 'package:dartz/dartz.dart';
import 'package:gif_navigator/features/gif_navigator/domain/entities/GifItem.dart';
import 'package:gif_navigator/features/gif_navigator/domain/repositories/GifItemRepository.dart';
import '../../../../core/error/Failures.dart';
class GetGifItems {
  final GifItemRepository repository;
  GetGifItems(this.repository);
  Future<Either<Failure, List<GifItem>>?> call(String query) async {
    return await repository.getGifItems(query);
  }
}
