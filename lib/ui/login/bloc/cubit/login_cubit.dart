import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sel_org/core/preference/preference.dart';
import 'package:sel_org/networking/api_exception.dart';
import 'package:sel_org/networking/models/api_response.dart';
import 'package:sel_org/networking/models/login/login_request.dart';
import 'package:sel_org/ui/login/bloc/state/login_state.dart';
import '../../../../repository/auth/login_repository.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  final Preference appPreference;

  LoginCubit(this.loginRepository, this.appPreference) : super(LoginInitial());

  void login(LoginRequest loginRequest) async {
    emit(LoginLoading());
    ApiResult apiResult = await loginRepository.login(loginRequest);
    switch (apiResult) {
      case Success():
        final successData = apiResult;
        // appPreference.savePrefString(key_auth_token, "auth token");
        emit(LoginSuccess(successData.value));
        break;
      case Error():
        emit(
            LoginError(NetworkExceptions.getErrorMessage(apiResult.exception)));
        break;
      default:
        break;
    }
  }
}
