import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sel_org/ui/account/bloc/state/refund_state.dart';

@injectable
class RefundCubit extends Cubit<RefundState> {
  RefundCubit() : super(RefundInitial());

  void getRefund() {
    emit(RefundLoading());
    Timer(
      const Duration(seconds: 3),
          () {
        emit(RefundLoaded());
      },
    );
  }
}
