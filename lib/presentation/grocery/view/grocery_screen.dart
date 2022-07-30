// packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
// views
import 'package:fooderlich_app/presentation/grocery/view/grocery_list_screen.dart';
import 'empty_grocery_screen.dart';
//
import '../bloc/grocery_list_bloc.dart';
import 'package:fooderlich_app/navigation/app_router.gr.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GroceryListBloc, GroceryListState>(
        builder: (context, state) {
          final groceryList = state.groceryList;
          if (groceryList.isEmpty) {
            return const EmptyGroceryScreen();
          }
          return GroceryListScreen(
            items: groceryList,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(CreateGroceryItemRouter());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
