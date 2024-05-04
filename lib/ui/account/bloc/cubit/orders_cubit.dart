import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../state/orders_state.dart';

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  void getOrders() {
    emit(OrdersLoading());
    Timer(
      const Duration(seconds: 3),
      () {
        emit(OrdersFetched());
      },
    );
  }
}
