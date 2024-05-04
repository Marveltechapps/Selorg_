import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sel_org/networking/models/login/login_response.dart';
import 'package:sel_org/networking/models/login/otp_verify_request.dart';
import 'package:sel_org/networking/models/login/otp_verify_response.dart';
import 'models/login/login_request.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'auth_api_service.g.dart';

@singleton
@RestApi(baseUrl: "https://devapi.selorg.com")
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @factoryMethod
  static AuthApiService create() {
    final dio = Dio();
    // dio.interceptors.add(AuthInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          compact: false,
          error: true));
    }
    return AuthApiService(dio);
  }

  @POST("/v1/customer/generate-otp")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST("/v1/customer/verify-otp")
  Future<OtpVerifyResponse> validateOtp(
      @Body() OtpVerifyRequest otpVerifyRequest);
}
