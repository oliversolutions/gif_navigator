import '../../domain/entities/GifItem.dart';

abstract class GifItemRemoteDataSource {
  Future<List<GifItem>> getGifItems();
}