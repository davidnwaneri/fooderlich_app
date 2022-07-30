import 'package:auto_route/auto_route.dart';
// views
import 'package:fooderlich_app/presentation/home/home_page.dart';
import 'package:fooderlich_app/presentation/explore/explore.screen.dart';
import 'package:fooderlich_app/presentation/recipe/recipe_view.dart';
import 'package:fooderlich_app/presentation/grocery/view/grocery_screen.dart';
import 'package:fooderlich_app/presentation/grocery/view/create_grocery_item_screen.dart';
import 'package:fooderlich_app/profile/profile_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: HomePage,
      children: [
        AutoRoute(
          path: 'explore',
          name: 'ExploreRouter',
          page: ExploreScreen,
        ),
        AutoRoute(
          path: 'recipe',
          name: 'RecipeRouter',
          page: RecipeView,
        ),
        AutoRoute(
          path: 'groceries',
          name: 'GroceryRouter',
          page: GroceryScreen,
        ),
      ],
    ),
    AutoRoute(
      path: 'edit-grocery-item',
      name: 'EditGroceryItemRouter',
      page: CreateGroceryItemScreen,
    ),
    AutoRoute(
      path: 'create-grocery-item',
      name: 'CreateGroceryItemRouter',
      page: CreateGroceryItemScreen,
    ),
    AutoRoute(
      path: '/profile',
      page: ProfilePage,
    ),
  ],
)
class $AppRouter {}
