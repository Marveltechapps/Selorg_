import 'package:equatable/equatable.dart';
import 'package:sel_org/networking/models/login/login_response.dart';

sealed class LoginState<S>{}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess<S> extends LoginState {
  LoginSuccess(this.loginResponse);
  final LoginResponse loginResponse;
}

class LoginError<S> extends LoginState {
  LoginError(this.errorMessage);
  final String errorMessage;
}