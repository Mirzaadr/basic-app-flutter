import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_app/constants/url.dart';

class ApiServices {
  static final ApiServices _instance = new ApiServices._internal();

  static BaseOptions opts = BaseOptions(
    baseUrl: APISettings.baseUrl,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  Dio dio = Dio(opts);

  factory ApiServices() {
    return _instance;
  }

  ApiServices._internal() {
    dio = Dio(opts);
  }

  Future<void> setClientToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    dio.options.headers['Authorization'] = 'bearer $token';
  }

  Future<bool> reloadToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      dio.options.headers['Authorization'] = 'bearer $token';
      return true;
    }
    return false;
  }
}
