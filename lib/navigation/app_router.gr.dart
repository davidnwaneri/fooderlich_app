// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../api/models/models.dart' as _i8;
import '../presentation/explore/explore.screen.dart' as _i3;
import '../presentation/grocery/view/create_grocery_item_screen.dart' as _i2;
import '../presentation/grocery/view/grocery_screen.dart' as _i5;
import '../presentation/home/home_page.dart' as _i1;
import '../presentation/recipe/recipe_view.dart' as _i4;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    EditGroceryItemRouter.name: (routeData) {
      final args = routeData.argsAs<EditGroceryItemRouterArgs>(
          orElse: () => const EditGroceryItemRouterArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.CreateGroceryItemScreen(
              key: args.key, groceryItemToEdit: args.groceryItemToEdit));
    },
    CreateGroceryItemRouter.name: (routeData) {
      final args = routeData.argsAs<CreateGroceryItemRouterArgs>(
          orElse: () => const CreateGroceryItemRouterArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.CreateGroceryItemScreen(
              key: args.key, groceryItemToEdit: args.groceryItemToEdit));
    },
    ExploreRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ExploreScreen());
    },
    RecipeRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RecipeView());
    },
    GroceryRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.GroceryScreen());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(HomeRoute.name, path: '/', children: [
          _i6.RouteConfig(ExploreRouter.name,
              path: 'explore', parent: HomeRoute.name),
          _i6.RouteConfig(RecipeRouter.name,
              path: 'recipe', parent: HomeRoute.name),
          _i6.RouteConfig(GroceryRouter.name,
              path: 'groceries', parent: HomeRoute.name)
        ]),
        _i6.RouteConfig(EditGroceryItemRouter.name, path: 'edit-grocery-item'),
        _i6.RouteConfig(CreateGroceryItemRouter.name,
            path: 'create-grocery-item')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CreateGroceryItemScreen]
class EditGroceryItemRouter
    extends _i6.PageRouteInfo<EditGroceryItemRouterArgs> {
  EditGroceryItemRouter({_i7.Key? key, _i8.GroceryItem? groceryItemToEdit})
      : super(EditGroceryItemRouter.name,
            path: 'edit-grocery-item',
            args: EditGroceryItemRouterArgs(
                key: key, groceryItemToEdit: groceryItemToEdit));

  static const String name = 'EditGroceryItemRouter';
}

class EditGroceryItemRouterArgs {
  const EditGroceryItemRouterArgs({this.key, this.groceryItemToEdit});

  final _i7.Key? key;

  final _i8.GroceryItem? groceryItemToEdit;

  @override
  String toString() {
    return 'EditGroceryItemRouterArgs{key: $key, groceryItemToEdit: $groceryItemToEdit}';
  }
}

/// generated route for
/// [_i2.CreateGroceryItemScreen]
class CreateGroceryItemRouter
    extends _i6.PageRouteInfo<CreateGroceryItemRouterArgs> {
  CreateGroceryItemRouter({_i7.Key? key, _i8.GroceryItem? groceryItemToEdit})
      : super(CreateGroceryItemRouter.name,
            path: 'create-grocery-item',
            args: CreateGroceryItemRouterArgs(
                key: key, groceryItemToEdit: groceryItemToEdit));

  static const String name = 'CreateGroceryItemRouter';
}

class CreateGroceryItemRouterArgs {
  const CreateGroceryItemRouterArgs({this.key, this.groceryItemToEdit});

  final _i7.Key? key;

  final _i8.GroceryItem? groceryItemToEdit;

  @override
  String toString() {
    return 'CreateGroceryItemRouterArgs{key: $key, groceryItemToEdit: $groceryItemToEdit}';
  }
}

/// generated route for
/// [_i3.ExploreScreen]
class ExploreRouter extends _i6.PageRouteInfo<void> {
  const ExploreRouter() : super(ExploreRouter.name, path: 'explore');

  static const String name = 'ExploreRouter';
}

/// generated route for
/// [_i4.RecipeView]
class RecipeRouter extends _i6.PageRouteInfo<void> {
  const RecipeRouter() : super(RecipeRouter.name, path: 'recipe');

  static const String name = 'RecipeRouter';
}

/// generated route for
/// [_i5.GroceryScreen]
class GroceryRouter extends _i6.PageRouteInfo<void> {
  const GroceryRouter() : super(GroceryRouter.name, path: 'groceries');

  static const String name = 'GroceryRouter';
}
