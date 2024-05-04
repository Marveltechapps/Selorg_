import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sel_org/networking/models/account/profile_request.dart';
import 'package:sel_org/networking/models/account/profile_response.dart';
import 'package:sel_org/networking/models/account/update_profile_request.dart';
import 'package:sel_org/networking/models/api_response.dart';
import 'package:sel_org/repository/account/app_repository.dart';

import '../../../../core/preference/app_preference.dart';
import '../../../../core/preference/preference.dart';

part '../state/profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final Preference appPreference;
  final AppRepository appRepository;
  ProfileCubit(this.appPreference, this.appRepository)
      : super(ProfileInitial());

  void getProfile() async {
    emit(ProfileLoading());
    String customerId = await appPreference.getPrefString(key_customer_id);
    ApiResult apiResult =
        await appRepository.getProfile(ProfileRequest(customerId));
    switch (apiResult) {
      case Success():
        final ProfileResponse profileResponse = apiResult.value;
        emit(ProfileLoaded(profileResponse.profile.name ?? "",
            profileResponse.profile.email ?? ""));
        break;

      case Error():
        emit(ProfileLoadingFailed());
        break;
    }
  }

  void updateProfile(String name, String email) async {
    final customerId = await appPreference.getPrefString(key_customer_id);
    ApiResult apiResult = await appRepository
        .updateProfile(UpdateProfileRequest(customerId, name, email));
    switch (apiResult) {
      case Success():
        emit(ProfileSaved());
        break;
      case Error():
        emit(ProfileSaveError());
        break;
    }
  }
}
