import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../state/policy_state.dart';

@injectable
class PolicyCubit extends Cubit<PolicyState> {
  PolicyCubit() : super(PolicyInitial());

  void getPolicy() {
    emit(PolicyLoading());
    Timer(
      const Duration(seconds: 3),
      () {
        emit(PolicyLoaded());
      },
    );
  }
}
