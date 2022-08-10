import 'package:flutter_test/flutter_test.dart';
import 'package:gif_navigator/features/gif_navigator/data/datasources/GifItemRemoteDataSource.dart';
import 'package:gif_navigator/features/gif_navigator/data/datasources/RestClient.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockRestClient extends Mock implements RestClient {}

void main() {

  late MockRestClient mockRestClient;
  late GifItemRemoteDataSourceImpl gifItemRemoteDataSourceImpl;

  setUp(() async {
    mockRestClient = MockRestClient();
    gifItemRemoteDataSourceImpl =
        GifItemRemoteDataSourceImpl(restClient: mockRestClient);
  });

  test(
    'should perform a GET request on /search',
    () async {
      when(mockRestClient.getGifItems("birthday", "0")).thenAnswer((_) async => fixture('gif_items.json'));
      gifItemRemoteDataSourceImpl.getGifItems("birthday", "0");
      verify(mockRestClient.getGifItems("birthday", "0"));
    },
  );
}
