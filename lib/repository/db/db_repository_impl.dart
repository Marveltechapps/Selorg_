import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:sel_org/repository/db/db_repository.dart';
import 'package:sel_org/ui/dashboard/models/cart_item.dart';

@prod
@Injectable(as: DbRepository)
class DbRepositoryImpl implements DbRepository {
  String cartBoxName = "cart_items";

  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox<CartItem>(cartBoxName);
    return box;
  }

  @override
  Future<void> addCartItem(Box box, CartItem cartItem) async {
    box.put(cartItem.skuCode, cartItem);
  }

  @override
  List<CartItem> getCartList(Box box) {
    return box.values.toList() as List<CartItem>;
  }

  @override
  Future<void> removeCartItem(Box box, CartItem cartItem) {
    // TODO: implement removeCartItem
    throw UnimplementedError();
  }

  @override
  Future<void> clearCart(Box box) async {
    box.clear();
  }
}
