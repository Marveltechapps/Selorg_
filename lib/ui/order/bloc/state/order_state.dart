sealed class OrderState {}

class OrderInitial extends OrderState {}

class CreateOrderLoading extends OrderState {}

class CreateOrderSuccess extends OrderState {}

class CreateOrderFailed extends OrderState {}

class TotalPrice extends OrderState {
  double finalPrice;
  TotalPrice(this.finalPrice);
}
