import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooderlich_app/presentation/explore/bloc/explore_data_bloc.dart';
import 'view/view.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreDataBloc, ExploreDataState>(
      builder: (context, state) {
        if (state is ExploreDataLoaded) {
          final recipes = state.recipes;
          final posts = state.posts;
          //TODO: Add pull to refresh
          return ListView(
            padding: const EdgeInsets.only(top: 10),
            children: [
              ExploreRecipesListView(recipes: recipes),
              const SizedBox(height: 8),
              FriendsPostListView(posts: posts),
            ],
          );
        } else if (state is ExploreDataError) {
          //TODO: Build error screen
          return const Center(
            child: Text('Error'),
          );
        }
        //TODO: Replace CircularProgressIndicator with a shimmer effect
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
