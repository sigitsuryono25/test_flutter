import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_flutter/datamodel/News.dart';

part 'RestApiClientNews.dart';

@RestApi(baseUrl: "https://newsapi.org/v2/")
abstract class ApiServiceNews {
  factory ApiServiceNews(Dio dio, {String baseUrl}) = RestApiClientNews;

//
  @GET("/everything")
  Future<News> getNews(@Query("q") String query, @Query("sortBy") String sortBy,
      {@Query("apiKey") String apiKey = "47d3665139a54a15be2ce60c88dd5fcb"});
}
