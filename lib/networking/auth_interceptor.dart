import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    // final authToken = preference.getString(key_auth_token);
    // options.headers['Accept'] = "application/json";
    options.headers['Content-Type'] = "application/json";
    // options.headers['Authorization'] = "Bearer $authToken";
    super.onRequest(options, handler);
  }

  /*@override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode  == 200) {
      response = Success(response.data) as Response;
      handler.next(response);
    } else if (response.statusCode == 401) {
      response = const Error(NetworkExceptions.unauthorisedRequest()) as Response;
      handler.next(response);
    } else {
      response = const Error(NetworkExceptions.internalServerError()) as Response;
    }
  }*/
}
