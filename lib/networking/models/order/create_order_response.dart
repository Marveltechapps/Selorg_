import 'package:json_annotation/json_annotation.dart';

part 'create_order_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateOrderResponse {
  CreateOrderStatusResponse OrderStatus;
  CreateOrderResponse(this.OrderStatus);

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) {
    return _$CreateOrderResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateOrderResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrderStatusResponse {
  int responseCode;
  String responseMessage;
  RequestStatus requestStatus;
  CreateOrderStatusResponse(this.responseCode, this.responseMessage, this.requestStatus);

  factory CreateOrderStatusResponse.fromJson(Map<String, dynamic> json) {
    return _$CreateOrderStatusResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateOrderStatusResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RequestStatus {
  String uniqueKey;
  String status;
  String? errorCode;
  String? errorDesc;
  RequestStatus(this.uniqueKey, this.status, this.errorCode, this.errorDesc);

  factory RequestStatus.fromJson(Map<String, dynamic> json) {
    return _$RequestStatusFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RequestStatusToJson(this);
}