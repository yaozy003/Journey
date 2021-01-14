import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future onResponse(Response response) {
    return _prefs.then((value) {
      value.setString('accessToken', response.headers.value('access-token'));
      value.setString('client', response.headers.value('client'));
      return super.onResponse(response);
    });
  }
}
