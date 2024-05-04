import 'package:sel_org/networking/models/account/address_request.dart';
import 'package:sel_org/networking/models/account/get_address_request.dart';
import 'package:sel_org/networking/models/account/profile_request.dart';
import 'package:sel_org/networking/models/account/update_profile_request.dart';
import 'package:sel_org/networking/models/order/create_order_request.dart';
import 'package:sel_org/networking/models/products/product_request.dart';
import 'package:sel_org/networking/models/products/sub_category_request.dart';

import '../../networking/models/api_response.dart';

abstract class AppRepository {
  Future<ApiResult> getProfile(ProfileRequest profileRequest);
  Future<ApiResult> updateProfile(UpdateProfileRequest updateProfileRequest);
  Future<ApiResult> getAllAddress(GetAddressRequest getAddressRequest);
  Future<ApiResult> addAddress(AddressRequest addressRequest);
  Future<ApiResult> editAddress(String addressId, AddressRequest addressRequest);
  Future<ApiResult> setDefaultAddress(String customerId, String addressId);
  Future<ApiResult> deleteAddress(String addressId);
  Future<ApiResult> getCategory();
  Future<ApiResult> getSubCategory(SubCategoryRequest subCategoryRequest);
  Future<ApiResult> getProducts(ProductRequest productRequest);
  Future<ApiResult> createOrder(CreateOrderRequest createOrderRequest);
}