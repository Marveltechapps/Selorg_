
import '../../../../networking/models/account/address_response.dart';
import '../../models/cart_item.dart';

sealed class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> cartItems;
  CartLoaded(this.cartItems);
}

class CartFetchFailed extends CartState {}

class AddressLoaded extends CartState {
  final Address? address;
  AddressLoaded(this.address);
}