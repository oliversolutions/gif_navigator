import 'dart:convert';
import '../../domain/entities/gif_item.dart';

class GifItemModel extends GifItem {

  const GifItemModel({required String url}) : super(url: url);

  static List<GifItemModel> parseGifItemsJsonResult(String jsonResult) {
    var data = jsonDecode(jsonResult);
    List<dynamic> dataArray = data["data"];
    List<GifItemModel> listGifItemModel = [];
    for (var element in dataArray) {
      listGifItemModel.add(GifItemModel(url: element["images"]["original"]["url"]));
    }
    return listGifItemModel;
  }
}
