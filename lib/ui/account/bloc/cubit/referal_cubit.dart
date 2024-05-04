// referals_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/referal_state.dart';

class ReferalsCubit extends Cubit<ReferalsState> {
  ReferalsCubit() : super(ReferalsInitial());
}
