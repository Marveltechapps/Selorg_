import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sel_org/networking/models/account/profile_update_response.dart';
import 'package:sel_org/networking/models/account/update_profile_request.dart';
import 'package:sel_org/networking/models/api_response.dart';
import 'package:sel_org/ui/login/bloc/state/update_name_state.dart';

import '../../../../core/preference/app_preference.dart';
import '../../../../core/preference/preference.dart';
import '../../../../repository/account/app_repository.dart';
import '../../../../repository/auth/login_repository.dart';

@injectable
class UpdateNameCubit extends Cubit<UpdateNameState> {
  final Preference appPreference;
  final LoginRepository loginRepository;
  final AppRepository appRepository;
  UpdateNameCubit(this.appPreference, this.loginRepository, this.appRepository)
      : super(UpdateNameInitial());

  void updateName(String name) async {
    emit(UpdateNameLoading());
    final customerId = await appPreference.getPrefString(key_customer_id);
    final email = await appPreference.getPrefString(key_email) ?? "";
    ApiResult apiResult = await appRepository
        .updateProfile(UpdateProfileRequest(customerId, name, email));
    switch (apiResult) {
      case Success():
        final profileUpdateResponse = apiResult.value as ProfileUpdateResponse;
        appPreference.savePrefString(
            key_name, profileUpdateResponse.customer.name ?? "");
        appPreference.savePrefString(
            key_email, profileUpdateResponse.customer.email ?? "");
        emit(UpdateNameSuccess());
        break;
      case Error():
        emit(UpdateNameFailed());
        break;
    }
  }
}
