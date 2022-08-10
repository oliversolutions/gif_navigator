import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'RestClient.g.dart';

const API_KEY = "B2fsdehjiNPc4gIokSAlu7F3YYMR1JF7";
const LIMIT = "20";
@RestApi(baseUrl: "https://api.giphy.com/v1/gifs")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET("/search?api_key=$API_KEY&limit=$LIMIT")
  Future<String>? getGifItems(@Query("q") String query, @Query("offset") String pagination);
}
