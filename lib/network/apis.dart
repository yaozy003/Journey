import 'package:dio/dio.dart';


class Apis {
  static RequestOptions additionalOptions =
      RequestOptions(baseUrl: 'https://fitbotic.pixelforcesystems.com.au/api/');

  static Future<Response> get(String path,
      {Map<String, dynamic> params}) async {
    additionalOptions.headers = {
      'X-USER-TIMEZONE': 'Australia/Adelaide',
      'X-USER-ID': '1135',
      'X-USER-ACCESS-TOKEN': 'pNJTQVktEzU99qQ37Moo',
    };
    return HttpCaller.instance
        .get(path, params: params, options: additionalOptions);
  }
}

class HttpCaller {
  static final HttpCaller instance = HttpCaller._internal();

  factory HttpCaller() => instance;

  HttpCaller._internal();

  static BaseOptions options = BaseOptions(
    connectTimeout: 8 * 1000,
    receiveTimeout: 8 * 1000,
    validateStatus: (status) {
      return true;
    },
  );
  var _dio = Dio(HttpCaller.options);

  Future<Response> get(String path,
      {Map<String, dynamic> params, RequestOptions options}) async {
    return _dio.get(path, queryParameters: params, options: options);
  }
}