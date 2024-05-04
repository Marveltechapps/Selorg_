import 'package:hive/hive.dart';
import '../../ui/dashboard/models/cart_item.dart';

abstract class DbRepository {
  Future<Box> openBox();
  List<CartItem> getCartList(Box box);
  Future<void> addCartItem(Box box, CartItem cartItem);
  Future<void> removeCartItem(Box box, CartItem cartItem);
  Future<void> clearCart(Box box);
}
