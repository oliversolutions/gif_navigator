import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gif_navigator/core/error/Exceptions.dart';
import 'package:gif_navigator/core/error/Failures.dart';
import 'package:gif_navigator/features/gif_navigator/data/datasources/GifItemRemoteDataSource.dart';
import 'package:gif_navigator/features/gif_navigator/data/repositories/GifItemRepositoryImpl.dart';
import 'package:gif_navigator/features/gif_navigator/domain/entities/GifItem.dart';
import 'package:mockito/mockito.dart';

class MockGifItemRemoteDataSource extends Mock
    implements GifItemRemoteDataSource {}

void main() {
  late GifItemRepositoryImpl repository;
  late MockGifItemRemoteDataSource mockGifItemRemoteDataSource;

  setUp(() {
    mockGifItemRemoteDataSource = MockGifItemRemoteDataSource();
    repository = GifItemRepositoryImpl(
      remoteDataSource: mockGifItemRemoteDataSource,
    );
  });

  group('getGifItems', () {

    final gifItems = [
      GifItem(
          url:
          'https://media3.giphy.com/media/g5R9dok94mrIvplmZd/giphy.gif?cid=a0caed7f5eqkv6ovitcfd4ok82ti76yngwxl7daridibcm6q&rid=giphy.gif&ct=g'),
      GifItem(
          url:
          'https://media0.giphy.com/media/MCeIiRETfwBK2rtGRi/giphy.gif?cid=a0caed7f5eqkv6ovitcfd4ok82ti76yngwxl7daridibcm6q&rid=giphy.gif&ct=g')
    ];

    test(
      'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockGifItemRemoteDataSource.getGifItems("birthday"))
            .thenAnswer((_) async => gifItems);
        // act
        final result = await repository.getGifItems("birthday");
        // assert
        verify(mockGifItemRemoteDataSource.getGifItems("birthday"));
        expect(result, equals(Right(gifItems)));
      },
    );
    test(
      'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockGifItemRemoteDataSource.getGifItems("birthday"))
            .thenThrow(ServerException());
        // act
        final result = await repository.getGifItems("birthday");
        // assert
        verify(mockGifItemRemoteDataSource.getGifItems("birthday"));
        expect(result, equals(Left(ServerFailure())));
      },
    );
  });
}
