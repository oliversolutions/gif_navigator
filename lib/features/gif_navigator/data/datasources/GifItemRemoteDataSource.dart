import 'dart:convert';

import 'package:gif_navigator/features/gif_navigator/data/datasources/RestClient.dart';
import 'package:gif_navigator/features/gif_navigator/data/models/GifItemModel.dart';

import '../../../../core/error/Exceptions.dart';
import '../../domain/entities/GifItem.dart';

abstract class GifItemRemoteDataSource {
  Future<List<GifItem>>? getGifItems();
}
class GifItemRemoteDataSourceImpl implements GifItemRemoteDataSource {

  final RestClient restClient;

  GifItemRemoteDataSourceImpl({required this.restClient});

  @override
  Future<List<GifItem>>? getGifItems() {
    restClient.getGifItems()?.then((it) {
      return GifItemModel.parseGifItemsJsonResult(it);
    }).catchError((Object obj) {
      throw ServerException();
    });
  }
}
