import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:sel_org/core/preference/app_preference.dart';
import 'package:sel_org/networking/models/account/address_response.dart';
import 'package:sel_org/networking/models/account/get_address_request.dart';
import 'package:sel_org/networking/models/api_response.dart';
import 'package:sel_org/repository/account/app_repository.dart';

import '../../../../core/preference/preference.dart';
import '../../../../repository/db/address_db_repository.dart';
import '../state/address_state.dart';

@injectable
class AddressCubit extends Cubit<AddressState> {
  final Preference appPreference;
  final AppRepository appRepository;
  final AddressDbRepository addressDbRepository;
  AddressCubit(this.appPreference, this.appRepository, this.addressDbRepository) : super(AddressInitial());

  void getAddress(bool isAddressPage) async {
    emit(AddressLoading());
    final customerId = await appPreference.getPrefString(key_customer_id);
    ApiResult apiResult = await appRepository.getAllAddress(GetAddressRequest(customerId));
    switch(apiResult) {
      case Success():
        final addressListResponse = apiResult.value as AddressListResponse;
        if (addressListResponse.addresses.isEmpty) {
          emit(AddressEmpty());
        } else {
          late Address address = addressListResponse.addresses.firstWhere((element) => element.isDefault);
          saveDefaultAddress(address);
          if (isAddressPage) {
            emit(AddressLoaded(addressListResponse));
          } else {
            emit(DefaultAddressLoaded(address));
          }
        }
        break;

      case Error():
        emit(AddressFetchFailed());
        break;
    }
  }

  void saveDefaultAddress(Address address) async {
    Box box = await addressDbRepository.openBox();
    addressDbRepository.saveDefaultAddress(box, address);
  }

  void getDefaultAddress() async {
    Box box = await addressDbRepository.openBox();
    final defaultAddress = await addressDbRepository.getDefaultAddress(box);
    if (defaultAddress == null) {
      getAddress(false);
    } else {
      emit(DefaultAddressLoaded(defaultAddress));
    }
  }
}
