//packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooderlich_app/api/api.dart';
import 'package:fooderlich_app/presentation/explore/bloc/explore_data_bloc.dart';
//
import 'package:fooderlich_app/presentation/home/cubit/bottom_navigation_cubit.dart';
//view
import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationCubit>(
          create: (context) => BottomNavigationCubit(),
        ),
        BlocProvider<ExploreDataBloc>(
          create: (context) => ExploreDataBloc(
            service: context.read<MockFooderlichService>(),
          )..add(const LoadExploreData()),
        ),
      ],
      child: HomeView(),
    );
  }
}
