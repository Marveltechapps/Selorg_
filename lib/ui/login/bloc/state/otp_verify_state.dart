sealed class OtpVerificationState<S>{}

class OtpVerifyInitial extends OtpVerificationState {}

class OtpVerifyLoading extends OtpVerificationState {}

class OtpVerifySuccess extends OtpVerificationState {
  OtpVerifySuccess();
}

class NameMissing extends OtpVerificationState {}

class OtpVerifyError extends OtpVerificationState {
  final String errorMessage;
  OtpVerifyError(this.errorMessage);
}