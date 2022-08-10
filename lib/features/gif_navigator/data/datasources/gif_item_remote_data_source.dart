import 'package:gif_navigator/features/gif_navigator/data/datasources/rest_client.dart';
import 'package:gif_navigator/features/gif_navigator/data/models/gif_item_model.dart';
import '../../../../core/error/Exceptions.dart';
import '../../domain/entities/gif_item.dart';

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