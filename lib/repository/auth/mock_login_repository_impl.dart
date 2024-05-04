import 'package:injectable/injectable.dart';
import 'package:sel_org/networking/api_exception.dart';
import 'package:sel_org/networking/auth_api_service.dart';
import 'package:sel_org/networking/models/api_response.dart';
import 'package:sel_org/networking/models/login/otp_verify_response.dart';

import '../../networking/models/login/login_request.dart';
import '../../networking/models/login/login_response.dart';
import '../../networking/models/login/otp_verify_request.dart';
import 'login_repository.dart';

@dev
@Injectable(as: LoginRepository)
class MockLoginRepositoryImpl implements LoginRepository {
  final AuthApiService apiService;

  MockLoginRepositoryImpl(this.apiService);

  @override
  Future<ApiResult> login(LoginRequest loginRequest) async {
    try {
      return Success(LoginResponse(200, "Login success"));
    } catch(e) {
      return const Error(NetworkExceptions.internalServerError());
    }
  }

  @override
  Future<ApiResult> verifyOtp(OtpVerifyRequest otpVerifyRequest) async {
    try {
      return Success(OtpVerifyResponse(200, "", Profile("", "", "", "", true, "")));
    } catch(e) {
      return const Error(NetworkExceptions.internalServerError());
    }
  }

}