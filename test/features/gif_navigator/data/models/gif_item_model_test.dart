import 'package:flutter_test/flutter_test.dart';
import 'package:gif_navigator/features/gif_navigator/data/models/gif_item_model.dart';
import 'package:gif_navigator/features/gif_navigator/domain/entities/gif_item.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  const gifItemModel = GifItemModel(
      url: 'https://media3.giphy.com/media/g5R9dok94mrIvplmZd/giphy.gif?cid=a0caed7f5eqkv6ovitcfd4ok82ti76yngwxl7daridibcm6q&rid=giphy.gif&ct=g'
  );
  test(
    'should be a subclass of GifItem entity',
    () async {
      expect(gifItemModel, isA<GifItem>());
    },
  );

  group('parseGifItemsJsonResult', () {
    List<GifItemModel> listGiftItemModel = [
      GifItemModel(url: 'http://www.google.es'),
      GifItemModel(url: 'http://sport.es'),
    ];
    test(
      'should return a valid model list when the JSON string is given',
      () async {
        final String jsonString = fixture('gif_items.json');
        final result = GifItemModel.parseGifItemsJsonResult(jsonString);
        expect(result, listGiftItemModel);
      },
    );
  });
}
