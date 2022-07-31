// package import
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooderlich_app/theme/app_theme.dart';
import 'package:fooderlich_app/theme/cubit/theme_cubit.dart';
//
import 'navigation/app_router.gr.dart';
import 'package:fooderlich_app/bloc_observer.dart';
import 'presentation/explore/bloc/explore_data_bloc.dart';
import 'presentation/grocery/bloc/grocery_list_bloc.dart';
import 'presentation/recipe/bloc/recipe_bloc.dart';
import 'package:fooderlich_app/api/api.dart';

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
    final _appRouter = AppRouter();
    return RepositoryProvider(
      create: (context) => MockFooderlichService(),
      child: MultiBlocProvider(
        providers: [
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
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Fooderlich',
              theme: FooderlichAppTheme.appTheme[AppTheme.light],
              darkTheme: FooderlichAppTheme.appTheme[AppTheme.dark],
              themeMode: state.themeMode,
              routerDelegate: _appRouter.delegate(),
              routeInformationParser: _appRouter.defaultRouteParser(),
              backButtonDispatcher: RootBackButtonDispatcher(),
            );
          },
        ),
      ),
    );
  }
}
