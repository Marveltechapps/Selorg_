import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sel_org/repository/account/app_repository.dart';
import 'package:sel_org/ui/products/bloc/state/sub_category_state.dart';

import '../../../../core/preference/preference.dart';
import '../../../../networking/models/api_response.dart';
import '../../../../networking/models/products/sub_category_request.dart';

@injectable
class SubCategoryCubit extends Cubit<SubCategoryState> {
  final Preference appPreference;
  final AppRepository appRepository;

  SubCategoryCubit(this.appPreference, this.appRepository) : super(SubCategoryInitial());

  void getSubCategory(String categoryCode) async {
    emit(SubCategoryLoading());
    ApiResult apiResult = await appRepository.getSubCategory(SubCategoryRequest(categoryCode));
    switch (apiResult) {
      case Success():
        emit(SubCategoryLoaded(apiResult.value));
        break;
      case Error():
        break;
    }
  }
}
