
sealed class AddAddressState {}

class AddAddressInitial extends AddAddressState {}

class AddAddressLoading extends AddAddressState {}

class AddAddressSuccess extends AddAddressState {}

class AddAddressFailed extends AddAddressState {}

class DeleteAddressLoading extends AddAddressState {}

class DeleteAddressSuccess extends AddAddressState {}

class DeleteAddressFailed extends AddAddressState {}

class UpdateAddressSuccess extends AddAddressState {}

class UpdateAddressFailed extends AddAddressState {}

class DefaultAddressChanged extends AddAddressState {}

class DefaultAddressChangeFailed extends AddAddressState {}
