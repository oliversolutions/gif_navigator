import 'package:dartz/dartz.dart';
import 'package:gif_navigator/features/gif_navigator/domain/entities/gif_item.dart';
import '../../../../core/error/Failures.dart';

abstract class GifItemRepository {
  Future<Either<Failure, List<GifItem>>>? getGifItems(String query, String pagination);
}
