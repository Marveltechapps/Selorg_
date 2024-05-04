abstract class OrderedState {}

class OrderedInitial extends OrderedState {}

class OrderedLoading extends OrderedState {}

class OrderedLoaded extends OrderedState {
  final List<String>
      orders; // Example: Just using a list of strings for simplicity
  OrderedLoaded(this.orders);
}

class OrderedError extends OrderedState {
  final String message;
  OrderedError(this.message);
}
