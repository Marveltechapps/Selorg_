// Define events
abstract class SearchEvent {}

class SearchTextChanged extends SearchEvent {
  final String searchText;

  SearchTextChanged({required this.searchText});
}

// Define states
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<String> results;

  SearchLoaded({required this.results});
}

class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});
}
