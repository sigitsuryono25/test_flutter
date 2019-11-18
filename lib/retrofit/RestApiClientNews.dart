part of 'ApiServiceNews.dart';

class RestApiClientNews implements ApiServiceNews {
  final Dio _dio;
  String baseUrl;

  RestApiClientNews(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, baseUrl);
    this.baseUrl = "https://newsapi.org/v2/";
  }

  @override
  getNews(String query, String sortBy,
      {String apiKey = "47d3665139a54a15be2ce60c88dd5fcb"}) async {
    const _extra = <String, dynamic>{};
    final _data = <String, dynamic>{
      "q": query,
      "sortBy": sortBy,
      "apiKey": apiKey
    };
    Map<String, dynamic> queryParameters = <String, dynamic>{};

    final Response<Map<String, dynamic>> _result = await _dio.request(
        "/everything",
        queryParameters: _data,
        options: RequestOptions(
            extra: _extra,
            method: "GET",
            baseUrl: baseUrl,
            headers: <String, dynamic>{}),
        data: queryParameters);
    var values = News.fromJsonMap(_result.data);
    return Future.value(values);
  }
}
