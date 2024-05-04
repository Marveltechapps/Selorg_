
import 'package:sel_org/networking/models/account/address_response.dart';

sealed class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressLoaded extends AddressState {
  final AddressListResponse addressListResponse;
  AddressLoaded(this.addressListResponse);
}

class DefaultAddressLoaded extends AddressState {
  final Address? address;
  DefaultAddressLoaded(this.address);
}

class AddressEmpty extends AddressState {}

class AddressFetchFailed extends AddressState {}
