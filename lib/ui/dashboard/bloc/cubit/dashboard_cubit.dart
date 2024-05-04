import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../repository/db/db_repository.dart';
import '../state/dashboard_state.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  final DbRepository dbRepository;

  DashboardCubit(this.dbRepository) : super(DashboardInitial());

  void listenForCartCount() async {
    Box box = await dbRepository.openBox();
    listCartCount();
    box.listenable().addListener(listCartCount);
  }

  void dismissCartListener() async {
    Box box = await dbRepository.openBox();
    box.listenable().removeListener(listCartCount);
  }

  void listCartCount() async {
    Box box = await dbRepository.openBox();
    emit(CartCount(box.values.length));
  }
}
