// package import
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//
import 'package:fooderlich_app/api/api.dart';
import 'package:fooderlich_app/bloc_observer.dart';
import 'api/models/grocery_item.dart';
import 'presentation/explore/bloc/explore_data_bloc.dart';
import 'presentation/grocery/bloc/grocery_list_bloc.dart';
import 'presentation/home/cubit/bottom_navigation_cubit.dart';
import 'presentation/recipe/bloc/recipe_bloc.dart';

// views import
import 'package:fooderlich_app/presentation/grocery/view/create_grocery_item_screen.dart';
import 'package:fooderlich_app/presentation/home/home_page.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const FooderlichApp());
    },
    blocObserver: FooderlichBlocObserver(),
  );
}

class FooderlichApp extends StatelessWidget {
  const FooderlichApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MockFooderlichService(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BottomNavigationCubit>(
            create: (context) => BottomNavigationCubit(),
          ),
          BlocProvider<ExploreDataBloc>(
            create: (context) => ExploreDataBloc(
              service: context.read<MockFooderlichService>(),
            )..add(const LoadExploreData()),
          ),
          BlocProvider<RecipeBloc>(
            create: (context) => RecipeBloc(
              service: context.read<MockFooderlichService>(),
            )..add(const LoadRecipes()),
          ),
          BlocProvider<GroceryListBloc>(
            create: (context) => GroceryListBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fooderlich',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
          initialRoute: HomePage.id,
          onGenerateRoute: (settings) {
            if (settings.name == HomePage.id) {
              return MaterialPageRoute(builder: (context) => const HomePage());
            }
            if (settings.name == CreateGroceryItemScreen.id) {
              return MaterialPageRoute(
                builder: (context) {
                  // This was my main reason of using the [onGenerateRoute] property
                  // to pass the [GroceryItem] to the [CreateGroceryItemScreen] when editing.
                  // Alternatively, I could have used the [routes] property and called [ModalRoute.of(context).settings.arguments]
                  // to get the [GroceryItem] from the [Navigator.pushNamed] call.
                  // This was a choice
                  // See [https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments] for more info.
                  final item = settings.arguments as GroceryItem?;
                  return CreateGroceryItemScreen(groceryItemToEdit: item);
                },
              );
            }
            //TODO: implement missing routes (404)
            return null;
          },
        ),
      ),
    );
  }
}
