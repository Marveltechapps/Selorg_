// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 2;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.customer_id)
      ..writeByte(1)
      ..write(obj.address_id)
      ..writeByte(2)
      ..write(obj.label)
      ..writeByte(3)
      ..write(obj.address1)
      ..writeByte(4)
      ..write(obj.address2)
      ..writeByte(5)
      ..write(obj.street)
      ..writeByte(6)
      ..write(obj.city)
      ..writeByte(7)
      ..write(obj.zip)
      ..writeByte(8)
      ..write(obj.landmark)
      ..writeByte(9)
      ..write(obj.latitude)
      ..writeByte(10)
      ..write(obj.longitude)
      ..writeByte(11)
      ..write(obj.isDefault);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressResponse _$AddressResponseFromJson(Map<String, dynamic> json) =>
    AddressResponse(
      json['code'] as int?,
      json['message'] as String,
      json['count'] as int?,
      (json['address'] as List<dynamic>)
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressResponseToJson(AddressResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'count': instance.count,
      'address': instance.address,
    };

AddressListResponse _$AddressListResponseFromJson(Map<String, dynamic> json) =>
    AddressListResponse(
      json['status'] as int?,
      json['message'] as String,
      json['count'] as int?,
      (json['addresses'] as List<dynamic>)
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressListResponseToJson(
        AddressListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'count': instance.count,
      'addresses': instance.addresses,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      json['customer_id'] as String,
      json['address_id'] as String,
      json['label'] as String,
      json['address1'] as String,
      json['address2'] as String,
      json['street'] as String,
      json['city'] as String,
      json['zip'] as String,
      json['landmark'] as String?,
      json['latitude'] as String?,
      json['longitude'] as String?,
      json['isDefault'] as bool,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'customer_id': instance.customer_id,
      'address_id': instance.address_id,
      'label': instance.label,
      'address1': instance.address1,
      'address2': instance.address2,
      'street': instance.street,
      'city': instance.city,
      'zip': instance.zip,
      'landmark': instance.landmark,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'isDefault': instance.isDefault,
    };
