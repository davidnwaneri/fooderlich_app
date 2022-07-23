import 'package:flutter/material.dart';
import 'package:fooderlich_app/api/models/models.dart';
import 'package:fooderlich_app/presentation/explore/components/components.dart';

class ExploreRecipesListView extends StatelessWidget {
  const ExploreRecipesListView({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  final List<ExploreRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Recipes of the Day',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 400,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recipes.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                return _BuildExploreListViewCard(recipe: recipes[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildExploreListViewCard extends StatelessWidget {
  const _BuildExploreListViewCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final ExploreRecipe recipe;

  @override
  Widget build(BuildContext context) {
    if (recipe.cardType == 'card1') {
      return Card1(
        image: AssetImage(recipe.backgroundImage),
        title: recipe.title,
        subtitle: recipe.subtitle,
        authorName: recipe.authorName,
        message: recipe.message,
      );
    } else if (recipe.cardType == 'card2') {
      return Card2(
        bgImage: AssetImage(recipe.backgroundImage),
        authorImage: AssetImage(recipe.profileImage),
        authorName: recipe.authorName,
        role: recipe.role,
        title: recipe.title,
        subtitle: recipe.subtitle,
      );
    } else {
      // then recipe.cardType == 'card3'
      return Card3(
        bgImage: AssetImage(recipe.backgroundImage),
        tags: recipe.tags,
        title: recipe.title,
      );
    }
  }
}
