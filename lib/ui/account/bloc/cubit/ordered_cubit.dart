import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/ordered_state.dart';

class OrderedCubit extends Cubit<OrderedState> {
  OrderedCubit() : super(OrderedInitial());

  void loadOrders() {
    emit(OrderedLoading());
    try {
      // Simulate fetching data
      List<String> fetchedOrders = ['Order 1', 'Order 2', 'Order 3'];
      emit(OrderedLoaded(fetchedOrders));
    } catch (e) {
      emit(OrderedError('Failed to fetch orders'));
    }
  }
}
