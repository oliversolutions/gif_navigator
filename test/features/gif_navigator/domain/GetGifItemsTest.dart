import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gif_navigator/features/gif_navigator/domain/entities/GifItem.dart';
import 'package:gif_navigator/features/gif_navigator/domain/repositories/GifItemRepository.dart';
import 'package:gif_navigator/features/gif_navigator/domain/usescases/GetGifItems.dart';
import 'package:mockito/mockito.dart';

class MockGifItemRepository extends Mock implements GifItemRepository {}

void main() {
  late GetGifItems usecase;
  late MockGifItemRepository mockGifItemRepository;

  setUp(() {
    mockGifItemRepository = MockGifItemRepository();
    usecase = GetGifItems(mockGifItemRepository);
  });

  var gifItems = [
    GifItem(
        url:
            'https://media3.giphy.com/media/g5R9dok94mrIvplmZd/giphy.gif?cid=a0caed7f5eqkv6ovitcfd4ok82ti76yngwxl7daridibcm6q&rid=giphy.gif&ct=g'),
    GifItem(
        url:
            'https://media0.giphy.com/media/MCeIiRETfwBK2rtGRi/giphy.gif?cid=a0caed7f5eqkv6ovitcfd4ok82ti76yngwxl7daridibcm6q&rid=giphy.gif&ct=g')
  ];

  test(
    'should get gif items from the repository',
    () async {
      when(mockGifItemRepository.getGifItems())
          .thenAnswer((_) async => Right(gifItems));

      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase();
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(gifItems));
      // Verify that the method has been called on the Repository
      verify(mockGifItemRepository.getGifItems());
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockGifItemRepository);
    },
  );
}
