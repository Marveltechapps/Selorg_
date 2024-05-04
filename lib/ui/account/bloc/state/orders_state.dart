
sealed class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersFetched extends OrdersState {}

class OrdersFetchFailed extends OrdersState {}
