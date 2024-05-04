import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../state/faq_state.dart';

@injectable
class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());

  void getFaq() {
    emit(FaqLoading());
    Timer(
      const Duration(seconds: 3),
          () {
        emit(FaqLoaded());
      },
    );
  }
}
