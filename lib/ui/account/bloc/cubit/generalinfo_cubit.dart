import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralPolicyCubit extends Cubit<GeneralPolicyState> {
  GeneralPolicyCubit() : super(GeneralPolicyInitial());
}

abstract class GeneralPolicyState {}

class GeneralPolicyInitial extends GeneralPolicyState {}
