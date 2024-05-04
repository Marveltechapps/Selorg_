import 'package:sel_org/networking/models/products/product_response.dart';
import 'package:sel_org/networking/models/products/sub_category_response.dart';

sealed class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final ProductResponse productResponse;
  ProductLoaded(this.productResponse);
}

class ProductFetchFailed extends ProductState {}