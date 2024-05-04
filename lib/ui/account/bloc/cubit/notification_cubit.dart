import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState(isOn: false));

  void toggleSwitch(bool newValue) {
    emit(state.copyWith(isOn: newValue));
  }
}
