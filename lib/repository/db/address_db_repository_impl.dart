
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:sel_org/networking/models/account/address_response.dart';

import 'address_db_repository.dart';

@prod
@Injectable(as: AddressDbRepository)
class AddressDbRepositoryImpl extends AddressDbRepository {
  String addressBoxName = "address";

  @override
  Future<Box> openBox() async {
    return Hive.openBox(addressBoxName);
  }

  @override
  Future<void> saveDefaultAddress(Box box, Address address) async {
    box.values.toList().forEach((element) {(element as Address).delete();});
    box.put(address.address_id, address);
  }

  @override
  Future<Address?> getDefaultAddress(Box box) async {
    List<Address> addressList = box.values.toList().cast<Address>();
    if (addressList.isNotEmpty) {
      final defaultAddress = addressList.first;
      return defaultAddress;
    } else {
      return null;
    }
  }

}