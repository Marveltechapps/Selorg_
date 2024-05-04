import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<int> {
  AppCubit() : super(0); // Start with the first screen index

  void navigateTo(int index) {
    emit(index); // Update the current screen index
  }
}
