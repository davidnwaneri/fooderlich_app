// package import
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// views import
import 'cubit/bottom_navigation_cubit.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  static const _item1 = 'Explore';
  static const _item2 = 'Recipes';
  static const _item3 = 'To Buy';

  final List<Widget> _pages = [
    Center(
      child: Container(
        width: 200,
        height: 400,
        color: Colors.orange,
        alignment: Alignment.center,
        child: const Text(_item1),
      ),
    ),
    Center(
      child: Container(
        width: 200,
        height: 400,
        color: Colors.purple,
        alignment: Alignment.center,
        child: const Text(_item2),
      ),
    ),
    Center(
      child: Container(
        width: 200,
        height: 400,
        color: Colors.brown,
        alignment: Alignment.center,
        child: const Text(_item3),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int index = context.select<BottomNavigationCubit, int>((bnc) => bnc.state.index);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Fooderlich'),
      ),
      body: IndexedStack(
        index: index,
        children: _pages,
      ),
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
