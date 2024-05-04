import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/search_cubit.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchTextChanged) {
      yield* _mapSearchTextChangedToState(event.searchText);
    }
  }

  Stream<SearchState> _mapSearchTextChangedToState(String searchText) async* {
    yield SearchLoading();
    try {
      // Simulate search logic (replace this with actual search logic)
      List<String> filteredList = ['Apple', 'Banana', 'Mango']
          .where(
              (item) => item.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
      yield SearchLoaded(results: filteredList);
    } catch (e) {
      yield SearchError(message: e.toString());
    }
  }
}
