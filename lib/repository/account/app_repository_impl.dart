import 'package:injectable/injectable.dart';
import 'package:sel_org/networking/api_exception.dart';
import 'package:sel_org/networking/models/account/address_request.dart';
import 'package:sel_org/networking/models/account/get_address_request.dart';
import 'package:sel_org/networking/models/account/update_profile_request.dart';
import 'package:sel_org/networking/models/api_response.dart';
import 'package:sel_org/networking/models/order/create_order_request.dart';
import 'package:sel_org/networking/models/products/sub_category_request.dart';
import 'package:sel_org/repository/account/app_repository.dart';

import '../../networking/api_service.dart';
import '../../networking/models/account/profile_request.dart';
import '../../networking/models/products/product_request.dart';

@prod
@Injectable(as: AppRepository)
class AppRepositoryImpl implements AppRepository {
  final ApiService apiService;
  AppRepositoryImpl(this.apiService);

  @override
  Future<ApiResult> getProfile(ProfileRequest profileRequest) async {
    try {
      final profileResponse = await apiService.getProfile(profileRequest);
      return Success(profileResponse);
    } catch(e) {
      return Error(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> updateProfile(UpdateProfileRequest updateProfileRequest) async {
    try {
      final profileUpdateResponse = await apiService.updateProfile(updateProfileRequest);
      return Success(profileUpdateResponse);
    } catch(e) {
      return Error(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> getAllAddress(GetAddressRequest getAddressRequest) async {
    try {
      final addressListResponse = await apiService.getAllAddress(getAddressRequest);
      return Success(addressListResponse);
    } catch(e) {
      return Error(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> addAddress(AddressRequest addressRequest) async {
    try {
      final addressResponse = await apiService.addAddress(addressRequest);
      return Success(addressResponse);
    } catch(e) {
      return Error(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> editAddress(String addressId, AddressRequest addressRequest) async {
    try {
      final addressResponse = await apiService.editAddress(addressId, addressRequest);
      return Success(addressResponse);
    } catch(e) {
      print(e.toString());
      return Error(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> setDefaultAddress(String customerId, String addressId) async {
    try {
      final addressResponse = await apiService.setDefaultAddress(customerId, addressId);
      return Success(addressResponse);
    } catch(e) {
      return Error(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> deleteAddress(String addressId) async {
    try {
      apiService.deleteAddress(addressId);
      return Success("");
    } catch(e) {
      return Error(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> getCategory() async {
    try {
      final categoryResponse = await apiService.getCategory();
      return Success(categoryResponse);
    } catch(e) {
      return Error(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> getSubCategory(SubCategoryRequest subCategoryRequest) async {
    try {
      final subCategoryResponse = await apiService.getSubCategory(subCategoryRequest);
      return Success(subCategoryResponse);
    } catch(e) {
      return Error(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> getProducts(ProductRequest productRequest) async {
    try {
      final productResponse = await apiService.getProducts(productRequest);
      return Success(productResponse);
    } catch(e) {
      return Error(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> createOrder(CreateOrderRequest createOrderRequest) async {
    try {
      final createOrderResponse = await apiService.createOrder(createOrderRequest);
      return Success(createOrderResponse);
    } catch(e) {
      return Error(NetworkExceptions.getDioException(e));
    }
  }

}