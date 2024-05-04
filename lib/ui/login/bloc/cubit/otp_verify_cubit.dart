import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sel_org/networking/models/api_response.dart';
import 'package:sel_org/networking/models/login/otp_verify_request.dart';
import 'package:sel_org/networking/models/login/otp_verify_response.dart';
import 'package:sel_org/ui/login/bloc/state/otp_verify_state.dart';

import '../../../../core/preference/app_preference.dart';
import '../../../../core/preference/preference.dart';
import '../../../../repository/auth/login_repository.dart';
import '../../../../repository/db/address_db_repository.dart';
import '../../../../repository/db/db_repository.dart';

@injectable
// class OtpVerifyCubit extends Cubit<OtpVerificationState> {
//   final Preference appPreference;
//   final LoginRepository loginRepository;
//   final DbRepository dbRepository;
//   final AddressDbRepository addressDbRepository;
//   OtpVerifyCubit(this.appPreference, this.loginRepository, this.dbRepository,
//       this.addressDbRepository)
//       : super(OtpVerifyInitial());
//
//   void verifyOtp(String phoneNumber, String otpCode) async {
//     emit(OtpVerifyLoading());
//
//     // Simulating successful verification without checking OTP
//     emit(OtpVerifySuccess());
//   }
// }

class OtpVerifyCubit extends Cubit<OtpVerificationState> {
  final Preference appPreference;
  final LoginRepository loginRepository;
  final DbRepository dbRepository;
  final AddressDbRepository addressDbRepository;

  OtpVerifyCubit(this.appPreference, this.loginRepository, this.dbRepository,
      this.addressDbRepository)
      : super(OtpVerifyInitial());

  void verifyOtp(String phoneNumber, String otpCode) async {
    emit(OtpVerifyLoading());
    ApiResult apiResult =
        await loginRepository.verifyOtp(OtpVerifyRequest(phoneNumber, otpCode));
    switch (apiResult) {
      case Success():
        await dbRepository.openBox();
        await addressDbRepository.openBox();
        final value = apiResult.value as OtpVerifyResponse;
        if (value.status == 200) {
          final customerName = value.customer.name ?? "";
          appPreference.savePrefString(
              key_customer_id, value.customer.customer_id);
          appPreference.savePrefString(key_name, customerName);
          appPreference.savePrefString(key_email, value.customer.email ?? "");
          appPreference.savePrefString(
              key_phone_number, value.customer.phoneNumber);
          if (customerName.isEmpty) {
            emit(NameMissing());
          } else {
            emit(OtpVerifySuccess());
          }
        } else {
          emit(OtpVerifyError(
              "Verification has failed. Please enter a valid OTP."));
        }
        break;
      case Error():
        emit(OtpVerifyError("OTP verification has failed. Please try again."));
        break;
    }
  }
}
