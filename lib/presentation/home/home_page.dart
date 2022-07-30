// package import
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
//
import 'package:fooderlich_app/navigation/app_router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const _item1 = 'Explore';
  static const _item2 = 'Recipes';
  static const _item3 = 'To Buy';

  final List<PageRouteInfo> _pages = const [
    ExploreRouter(),
    RecipeRouter(),
    GroceryRouter(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        centerTitle: true,
        title: const Text('Fooderlich'),
        leading: const AutoLeadingButton(),
      ),
      routes: _pages,
      bottomNavigationBuilder: (_, tabsRouter) =>  BottomNavigationBar(
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
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
      ),
    );
  }
}
