import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sel_org/networking/models/api_response.dart';
import 'package:sel_org/networking/models/products/sub_category_request.dart';
import 'package:sel_org/ui/dashboard/models/cart_item.dart';
import 'package:sel_org/ui/products/bloc/state/product_state.dart';

import '../../../../core/preference/preference.dart';
import '../../../../networking/models/products/product_request.dart';
import '../../../../repository/account/app_repository.dart';
import '../../../../repository/db/db_repository.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final Preference appPreference;
  final AppRepository appRepository;
  final DbRepository dbRepository;
  ProductCubit(this.appPreference, this.appRepository, this.dbRepository) : super(ProductInitial());

  void getProducts(String subCategoryCode) async {
    emit(ProductLoading());
    ApiResult apiResult = await appRepository.getProducts(ProductRequest(subCategoryCode));
    switch(apiResult) {
      case Success():
        emit(ProductLoaded(apiResult.value));
        break;
      case Error():

        break;
    }
  }

  void addToCart(CartItem cartItem) async {
    Box box = await dbRepository.openBox();
    dbRepository.addCartItem(box, cartItem);
  }
}
