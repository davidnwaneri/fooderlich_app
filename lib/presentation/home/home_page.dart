// package import
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooderlich_app/presentation/grocery/view/grocery_screen.dart';
//
import 'cubit/bottom_navigation_cubit.dart';
// views import
import 'package:fooderlich_app/presentation/explore/explore.screen.dart';
import 'package:fooderlich_app/presentation/recipe/recipe_view.dart';

class HomePage extends StatelessWidget {
  static const id = 'home_page';
  const HomePage({Key? key}) : super(key: key);

  static const _item1 = 'Explore';
  static const _item2 = 'Recipes';
  static const _item3 = 'To Buy';

  final List<Widget> _pages = const [
    ExploreScreen(),
    RecipeView(),
    GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    int index = context.select<BottomNavigationCubit, int>((bnc) => bnc.state.index);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Fooderlich'),
      ),
      body: _pages[index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: _item1,
            tooltip: _item1,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: _item2,
            tooltip: _item2,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: _item3,
            tooltip: _item3,
          ),
        ],
        currentIndex: index,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    context.read<BottomNavigationCubit>().changeToIndex(index);
  }
}
