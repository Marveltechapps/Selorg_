class AddressModel {
  final String addressId;
  final String label;
  final String address1;
  final String address2;
  final String street;
  final String city;
  final String? landmark;
  final String pinCode;
  final String? latitude;
  final String? longitude;
  final bool isDefault;
  final bool isEdit;
  AddressModel(
      
      this.addressId,
      this.label,
      this.address1,
      this.address2,
      this.street,
      this.city,
      this.landmark,
      this.pinCode,
      this.latitude,
      this.longitude,
      this.isDefault,
      this.isEdit);
}
