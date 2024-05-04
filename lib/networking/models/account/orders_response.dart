import 'package:freezed_annotation/freezed_annotation.dart';
part 'orders_response.g.dart';

@JsonSerializable()
class OrdersResponse {
  final List<OrderItem> orderList;
  OrdersResponse(this.orderList);

  factory OrdersResponse.fromJson(Map<String, dynamic> json) {
    return _$OrdersResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrdersResponseToJson(this);
}

@JsonSerializable()
class OrderItem {
  final String id;
  final String placedDate;
  final String title;
  final String status;
  final String totalPrice;
  OrderItem(this.id, this.placedDate, this.title, this.status, this.totalPrice);

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return _$OrderItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}