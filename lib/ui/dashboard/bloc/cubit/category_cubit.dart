import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sel_org/networking/models/api_response.dart';

import '../../../../core/preference/preference.dart';
import '../../../../repository/account/app_repository.dart';
import '../state/category_state.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  final Preference appPreference;
  final AppRepository appRepository;

  CategoryCubit(this.appPreference, this.appRepository) : super(CategoryInitial());

  void getCategory() async {
    emit(CategoryLoading());
    ApiResult apiResult = await appRepository.getCategory();
    switch (apiResult) {
      case Success():
        emit(CategoryLoaded(apiResult.value));
        break;
      case Error():
        break;
    }
  }
}
