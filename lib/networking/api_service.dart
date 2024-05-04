import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sel_org/networking/models/account/address_request.dart';
import 'package:sel_org/networking/models/account/get_address_request.dart';
import 'package:sel_org/networking/models/account/profile_request.dart';
import 'package:sel_org/networking/models/account/profile_update_response.dart';
import 'package:sel_org/networking/models/account/update_profile_request.dart';
import 'package:sel_org/networking/models/order/create_order_request.dart';
import 'package:sel_org/networking/models/products/product_request.dart';
import 'package:sel_org/networking/models/products/sub_category_request.dart';
import 'auth_interceptor.dart';
import 'models/account/add_address_response.dart';
import 'models/account/address_response.dart';
import 'models/account/profile_response.dart';
import 'models/order/create_order_response.dart';
import 'models/products/category_response.dart';
import 'models/products/product_response.dart';
import 'models/products/sub_category_response.dart';
part 'api_service.g.dart';

@singleton
@RestApi(baseUrl: "https://devapi.selorg.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @factoryMethod
  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
        error: true,
      ));
    }
    return ApiService(dio);
  }

  @POST("/v1/customer/get-profile")
  Future<ProfileResponse> getProfile(@Body() ProfileRequest profileRequest);

  @POST("/v1/customer/update-profile")
  Future<ProfileUpdateResponse> updateProfile(
      @Body() UpdateProfileRequest updateProfileRequest);

  @POST("/v1/address/get-all-address")
  Future<AddressListResponse> getAllAddress(
      @Body() GetAddressRequest getAddressRequest);

  @POST("/v1/address/add")
  Future<AddAddressResponse> addAddress(@Body() AddressRequest addressRequest);

  @PUT("/v1/address/edit/{address_id}")
  Future<AddAddressResponse> editAddress(@Path("address_id") String address_id,
      @Body() AddressRequest addressRequest);

  @PUT("/v1/address/setdefault/{customer_id}/{address_id}")
  Future<AddAddressResponse> setDefaultAddress(
      @Path("customer_id") String customerId,
      @Path("address_id") String addressId);

  @DELETE("/v1/address/delete/{address_id}")
  Future<void> deleteAddress(@Path("address_id") String addressId);

  @POST("/v1/category/list")
  Future<CategoryResponse> getCategory();

  @POST("/v1/subCategory/list")
  Future<SubCategoryResponse> getSubCategory(
      @Body() SubCategoryRequest subCategoryRequest);

  @POST("/v1/product/getProducts")
  Future<ProductResponse> getProducts(@Body() ProductRequest productRequest);

  @POST("/v1/order/create")
  Future<CreateOrderResponse> createOrder(
      @Body() CreateOrderRequest createOrderRequest);
}
