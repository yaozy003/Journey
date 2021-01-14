import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'header_interceptor.dart';

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
  var _logger = LogInterceptor(responseBody: true);
  var _headerReader = HeaderInterceptor();

  void _interceptors() {
    if (!_dio.interceptors.contains(_logger)) {
      _dio.interceptors.add(_logger);
    }
    if (!_dio.interceptors.contains(_headerReader)) {
      _dio.interceptors.add(_headerReader);
    }
  }

  Future<Response> get(String path,
      {Map<String, dynamic> params, RequestOptions options}) async {
    _interceptors();
    return _dio.get(path, queryParameters: params, options: options);
  }

  Future<Response> post(String path,
      {Map<String, dynamic> params, RequestOptions options}) async {
    _interceptors();
    return SharedPreferences.getInstance().then((value) {
      return _dio.post(path, queryParameters: params, options: options);
    });
  }

  Future<Response> postForm(String path,
      {Map<String, dynamic> data,
      ProgressCallback onSendProgress,
      ProgressCallback onReceiveProgress,
      RequestOptions options}) async {
    _interceptors();
    return SharedPreferences.getInstance().then((value) {
      return _dio.post(path,
          data: data,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
          options: options);
    });
  }

  Future<Response> put(String path,
      {Map<String, dynamic> params, RequestOptions options}) async {
    _interceptors();
    return SharedPreferences.getInstance().then((value) {
      return _dio.put(path, queryParameters: params, options: options);
    });
  }

  Future<Response> putForm(String path,
      {Map<String, dynamic> data,
      ProgressCallback onSendProgress,
      ProgressCallback onReceiveProgress,
      RequestOptions options}) async {
    _interceptors();
    return SharedPreferences.getInstance().then((value) {
      return _dio.put(path,
          data: data,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
          options: options);
    });
  }

  Future<Response> delete(String path,
      {Map<String, dynamic> params, RequestOptions options}) async {
    _interceptors();
    return SharedPreferences.getInstance().then((value) {
      return _dio.delete(path, queryParameters: params, options: options);
    });
  }

  Future<Response> download(String uri, savePath,
      {ProgressCallback onReceiveProgress, RequestOptions options}) async {
    _interceptors();
    return SharedPreferences.getInstance().then((value) {
      return _dio.download(uri, savePath,
          onReceiveProgress: onReceiveProgress, options: options);
    });
  }
}
