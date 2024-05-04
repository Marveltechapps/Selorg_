import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestionsCubit extends Cubit<SuggestionsState> {
  SuggestionsCubit() : super(SuggestionsInitial());

  void closeButton() {
    // Additional logic can be added here if needed
  }

  void sendSuggestion() {
    // Logic to handle sending a suggestion
  }

  void finishSuggestion() {
    // Logic to handle post-suggestion actions
  }
}

abstract class SuggestionsState {}

class SuggestionsInitial extends SuggestionsState {}
