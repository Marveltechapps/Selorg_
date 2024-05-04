import 'package:hive/hive.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 1)
class CartItem extends HiveObject{
  @HiveField(0)
  String skuCode;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
  final String quantity;
  @HiveField(4)
  String price;
  @HiveField(5)
  String mrpPrice;
  @HiveField(6)
  final String baseCost;
  @HiveField(7)
  final String vendorName;
  @HiveField(8)
  final String isActive;
  @HiveField(9)
  final String isStocked;
  @HiveField(10)
  int orderQty;

  CartItem(this.skuCode, this.name, this.imageUrl, this.quantity, this.price, this.mrpPrice, this.baseCost, this.vendorName, this.isActive, this.isStocked, this.orderQty);
}