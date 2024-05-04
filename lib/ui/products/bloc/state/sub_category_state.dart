
import '../../../../networking/models/products/sub_category_response.dart';

sealed class SubCategoryState {}

class SubCategoryInitial extends SubCategoryState {}

class SubCategoryLoading extends SubCategoryState {}

class SubCategoryLoaded extends SubCategoryState {
  final SubCategoryResponse subCategoryResponse;
  SubCategoryLoaded(this.subCategoryResponse);
}
