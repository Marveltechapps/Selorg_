
import 'package:sel_org/networking/models/products/category_response.dart';

sealed class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  CategoryResponse categoryResponse;
  CategoryLoaded(this.categoryResponse);
}

class CategoryFetchError extends CategoryState {}

