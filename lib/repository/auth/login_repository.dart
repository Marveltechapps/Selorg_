import 'package:sel_org/networking/models/api_response.dart';
import 'package:sel_org/networking/models/login/login_request.dart';
import 'package:sel_org/networking/models/login/otp_verify_request.dart';

abstract class LoginRepository {
  Future<ApiResult> login(LoginRequest loginRequest);
  Future<ApiResult> verifyOtp(OtpVerifyRequest otpVerifyRequest);
}
