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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../api/models/models.dart' as _i9;
import '../presentation/explore/explore.screen.dart' as _i4;
import '../presentation/grocery/view/create_grocery_item_screen.dart' as _i2;
import '../presentation/grocery/view/grocery_screen.dart' as _i6;
import '../presentation/home/home_page.dart' as _i1;
import '../presentation/recipe/recipe_view.dart' as _i5;
import '../profile/profile_page.dart' as _i3;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    EditGroceryItemRouter.name: (routeData) {
      final args = routeData.argsAs<EditGroceryItemRouterArgs>(
          orElse: () => const EditGroceryItemRouterArgs());
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.CreateGroceryItemScreen(
              key: args.key, groceryItemToEdit: args.groceryItemToEdit));
    },
    CreateGroceryItemRouter.name: (routeData) {
      final args = routeData.argsAs<CreateGroceryItemRouterArgs>(
          orElse: () => const CreateGroceryItemRouterArgs());
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.CreateGroceryItemScreen(
              key: args.key, groceryItemToEdit: args.groceryItemToEdit));
    },
    ProfileRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ProfilePage());
    },
    ExploreRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ExploreScreen());
    },
    RecipeRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.RecipeView());
    },
    GroceryRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.GroceryScreen());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(HomeRoute.name, path: '/', children: [
          _i7.RouteConfig(ExploreRouter.name,
              path: 'explore', parent: HomeRoute.name),
          _i7.RouteConfig(RecipeRouter.name,
              path: 'recipe', parent: HomeRoute.name),
          _i7.RouteConfig(GroceryRouter.name,
              path: 'groceries', parent: HomeRoute.name)
        ]),
        _i7.RouteConfig(EditGroceryItemRouter.name, path: 'edit-grocery-item'),
        _i7.RouteConfig(CreateGroceryItemRouter.name,
            path: 'create-grocery-item'),
        _i7.RouteConfig(ProfileRoute.name, path: '/profile')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CreateGroceryItemScreen]
class EditGroceryItemRouter
    extends _i7.PageRouteInfo<EditGroceryItemRouterArgs> {
  EditGroceryItemRouter({_i8.Key? key, _i9.GroceryItem? groceryItemToEdit})
      : super(EditGroceryItemRouter.name,
            path: 'edit-grocery-item',
            args: EditGroceryItemRouterArgs(
                key: key, groceryItemToEdit: groceryItemToEdit));

  static const String name = 'EditGroceryItemRouter';
}

class EditGroceryItemRouterArgs {
  const EditGroceryItemRouterArgs({this.key, this.groceryItemToEdit});

  final _i8.Key? key;

  final _i9.GroceryItem? groceryItemToEdit;

  @override
  String toString() {
    return 'EditGroceryItemRouterArgs{key: $key, groceryItemToEdit: $groceryItemToEdit}';
  }
}

/// generated route for
/// [_i2.CreateGroceryItemScreen]
class CreateGroceryItemRouter
    extends _i7.PageRouteInfo<CreateGroceryItemRouterArgs> {
  CreateGroceryItemRouter({_i8.Key? key, _i9.GroceryItem? groceryItemToEdit})
      : super(CreateGroceryItemRouter.name,
            path: 'create-grocery-item',
            args: CreateGroceryItemRouterArgs(
                key: key, groceryItemToEdit: groceryItemToEdit));

  static const String name = 'CreateGroceryItemRouter';
}

class CreateGroceryItemRouterArgs {
  const CreateGroceryItemRouterArgs({this.key, this.groceryItemToEdit});

  final _i8.Key? key;

  final _i9.GroceryItem? groceryItemToEdit;

  @override
  String toString() {
    return 'CreateGroceryItemRouterArgs{key: $key, groceryItemToEdit: $groceryItemToEdit}';
  }
}

/// generated route for
/// [_i3.ProfilePage]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i4.ExploreScreen]
class ExploreRouter extends _i7.PageRouteInfo<void> {
  const ExploreRouter() : super(ExploreRouter.name, path: 'explore');

  static const String name = 'ExploreRouter';
}

/// generated route for
/// [_i5.RecipeView]
class RecipeRouter extends _i7.PageRouteInfo<void> {
  const RecipeRouter() : super(RecipeRouter.name, path: 'recipe');

  static const String name = 'RecipeRouter';
}

/// generated route for
/// [_i6.GroceryScreen]
class GroceryRouter extends _i7.PageRouteInfo<void> {
  const GroceryRouter() : super(GroceryRouter.name, path: 'groceries');

  static const String name = 'GroceryRouter';
}
