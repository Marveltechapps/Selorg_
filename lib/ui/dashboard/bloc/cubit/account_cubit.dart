import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sel_org/core/preference/preference.dart';
import 'package:sel_org/ui/dashboard/bloc/state/account_state.dart';

import '../../../../repository/db/address_db_repository.dart';
import '../../../../repository/db/db_repository.dart';

@injectable
class AccountCubit extends Cubit<AccountState>{
  final Preference appPreference;
  final DbRepository dbRepository;
  final AddressDbRepository addressDbRepository;
  AccountCubit(this.appPreference, this.dbRepository, this.addressDbRepository): super(AccountInitial());

  void fetchAccount() {

  }

  void logOut() async {
    await appPreference.clearAll();
    final box = await dbRepository.openBox();
    dbRepository.clearCart(box);
    final addressBox = await addressDbRepository.openBox();
    addressBox.clear();
    emit(AccountLogOut());
  }
}