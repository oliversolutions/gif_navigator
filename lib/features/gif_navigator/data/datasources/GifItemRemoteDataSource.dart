import 'package:gif_navigator/features/gif_navigator/data/datasources/RestClient.dart';
import 'package:gif_navigator/features/gif_navigator/data/models/GifItemModel.dart';
import '../../../../core/error/Exceptions.dart';
import '../../domain/entities/GifItem.dart';

abstract class GifItemRemoteDataSource {
  Future<List<GifItem>>? getGifItems(String query, String pagination);
}
class GifItemRemoteDataSourceImpl implements GifItemRemoteDataSource {

  final RestClient restClient;

  GifItemRemoteDataSourceImpl({required this.restClient});

  @override
  Future<List<GifItem>>? getGifItems(String query, String pagination) async {
    try {
      final result = await restClient.getGifItems(query, pagination);
      return GifItemModel.parseGifItemsJsonResult(result!);
    } catch(e) {
      throw ServerException();
    }
  }
}