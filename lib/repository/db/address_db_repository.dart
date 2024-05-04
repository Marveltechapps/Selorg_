import 'package:hive/hive.dart';

import '../../networking/models/account/address_response.dart';

abstract class AddressDbRepository {
  Future<Box> openBox();
  Future<void> saveDefaultAddress(Box box, Address address);
  Future<Address?> getDefaultAddress(Box box);
}