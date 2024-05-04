import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sel_org/core/preference/app_preference.dart';
import 'package:sel_org/networking/models/account/address_request.dart';
import 'package:sel_org/networking/models/account/address_response.dart';
import 'package:sel_org/networking/models/api_response.dart';
import 'package:sel_org/ui/account/model/address_model.dart';

import '../../../../core/preference/preference.dart';
import '../../../../repository/account/app_repository.dart';
import '../state/add_address_state.dart';

@injectable
class AddAddressCubit extends Cubit<AddAddressState> {
  final Preference appPreference;
  final AppRepository appRepository;

  AddAddressCubit(this.appPreference, this.appRepository)
      : super(AddAddressInitial());

  void addAddress(AddressModel addressModel) async {
    emit(AddAddressLoading());
    final customerId = await appPreference.getPrefString(key_customer_id);
    ApiResult apiResult = await appRepository.addAddress(AddressRequest(
        customerId,
        "",
        addressModel.label,
        addressModel.address1,
        addressModel.address2,
        addressModel.street,
        addressModel.city,
        addressModel.landmark,
        addressModel.pinCode,
        addressModel.latitude,
        addressModel.longitude,
        true));
    switch (apiResult) {
      case Success():
        emit(AddAddressSuccess());
        break;

      case Error():
      default:
        emit(AddAddressFailed());
        break;
    }
  }

  void updateAddress(AddressModel addressModel) async {
    final customerId = await appPreference.getPrefString(key_customer_id);
    ApiResult apiResult = await appRepository.editAddress(
        addressModel.addressId,
        AddressRequest(
            customerId,
            addressModel.addressId,
            addressModel.label,
            addressModel.address1,
            addressModel.address2,
            addressModel.street,
            addressModel.city,
            addressModel.landmark,
            addressModel.pinCode,
            addressModel.latitude,
            addressModel.longitude,
            addressModel.isDefault));
    switch (apiResult) {
      case Success():
        emit(UpdateAddressSuccess());
        break;

      case Error():
      default:
        emit(UpdateAddressFailed());
        break;
    }
  }

  void deleteAddress(String addressId) async {
    emit(DeleteAddressLoading());
    ApiResult apiResult = await appRepository.deleteAddress(addressId);
    switch (apiResult) {
      case Success():
        emit(DeleteAddressSuccess());
        break;

      case Error():
      default:
        emit(DeleteAddressFailed());
        break;
    }
  }

  void setDefaultAddress(String addressId) async {
    final customerId = await appPreference.getPrefString(key_customer_id);
    ApiResult apiResult =
        await appRepository.setDefaultAddress(customerId, addressId);
    switch (apiResult) {
      case Success():
        emit(DefaultAddressChanged());
        break;

      case Error():
      default:
        emit(DefaultAddressChangeFailed());
        break;
    }
  }
}
