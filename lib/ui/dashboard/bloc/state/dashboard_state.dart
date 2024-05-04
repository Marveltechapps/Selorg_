
sealed class DashboardState {}

class DashboardInitial extends DashboardState {}

class CartCount extends DashboardState {
  final int count;
  CartCount(this.count);
}
