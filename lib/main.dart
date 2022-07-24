// package import
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//
import 'package:fooderlich_app/api/api.dart';
import 'package:fooderlich_app/bloc_observer.dart';
// views import
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fooderlich',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => MockFooderlichService(),
        child: const HomePage(),
      ),
    );
  }
}
