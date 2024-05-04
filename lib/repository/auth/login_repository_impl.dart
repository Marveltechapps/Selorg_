import 'package:injectable/injectable.dart';
import 'package:sel_org/networking/api_exception.dart';
import 'package:sel_org/networking/auth_api_service.dart';
import '../../networking/models/api_response.dart';
import '../../networking/models/login/login_request.dart';
import '../../networking/models/login/otp_verify_request.dart';
import 'login_repository.dart';

@prod
@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final AuthApiService apiService;

  LoginRepositoryImpl(this.apiService);

  @override
  Future<ApiResult> login(LoginRequest loginRequest) async {
    try {
      final loginResponse = await apiService.login(loginRequest);
      return Success(loginResponse);
    } catch (e) {
      print(e);
      return Error(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> verifyOtp(OtpVerifyRequest otpVerifyRequest) async {
    try {
      final otpVerifyResponse = await apiService.validateOtp(otpVerifyRequest);
      return Success(otpVerifyResponse);
    } catch (e) {
      return Error(NetworkExceptions.getDioException(e));
    }
  }
}
