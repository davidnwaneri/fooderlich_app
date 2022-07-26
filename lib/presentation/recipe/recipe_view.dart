import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//
import 'bloc/recipe_bloc.dart';
import 'components/recipe_thumbnail.dart';

/// A widget that displays a list of [SimpleRecipe]s.
class RecipeView extends StatelessWidget {
  const RecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RecipeGridView();
  }
}
class RecipeGridView extends StatelessWidget {
  const RecipeGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is RecipeLoaded) {
          final recipes = state.recipes;
          return GridView.builder(
            itemCount: recipes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.96 / 2,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return RecipeThumbnail(recipe: recipe);
            },
          );
        } else if (state is RecipeError) {
          return const Center(
            child: Text('Error'),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
