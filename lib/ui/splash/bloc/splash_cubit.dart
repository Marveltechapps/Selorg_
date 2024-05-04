import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sel_org/core/preference/app_preference.dart';
import 'package:sel_org/core/preference/preference.dart';
import 'package:sel_org/ui/splash/bloc/splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.appPreference) : super(SplashInitial());
  final Preference appPreference;

  void checkLoggedState() async {
    final authToken = await appPreference.getPrefString(key_customer_id);
    final name = await appPreference.getPrefString(key_name);
    Timer(
      const Duration(seconds: 2),
      () {
        if (authToken.isNotEmpty) {
          if (name.isNotEmpty) {
            emit(ShowDashboard());
          } else {
            emit(ShowUpdateName());
          }
        } else {
          emit(ShowLogin());
        }
      },
    );
  }
}
