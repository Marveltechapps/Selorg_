import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/search_cubit.dart';
import '../bloc/state/search_state.dart';

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const CircularProgressIndicator();
        } else if (state is SearchLoaded) {
          return ListView.builder(
            itemCount: state.results.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.results[index]),
                onTap: () {
                  // Handle navigation or further actions
                },
              );
            },
          );
        } else if (state is SearchError) {
          return Text('Error: ${state.message}');
        }
        return Container(); // Placeholder for other states
      },
    );
  }
}
