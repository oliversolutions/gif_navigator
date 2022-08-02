import 'package:dartz/dartz.dart';
import 'package:gif_navigator/features/gif_navigator/domain/entities/GifItem.dart';
import '../../../../core/error/Failures.dart';

abstract class GifItemRepository {
  Future<Either<Failure, List<GifItem>>>? getGifItems();
}
