// packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// views
import 'package:fooderlich_app/api/models/grocery_item.dart';
import 'package:fooderlich_app/presentation/grocery/view/create_grocery_item_screen.dart';
import 'grocery_item_tile.dart';
//
import '../bloc/grocery_list_bloc.dart';

class GroceryListScreen extends StatelessWidget {
  const GroceryListScreen({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<GroceryItem> items;

  void onToggleIsComplete(String id, bool? value, BuildContext context) {
    context.read<GroceryListBloc>().add(
          MarkGroceryItemAsComplete(id: id, condition: value!),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final item = items[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, CreateGroceryItemScreen.id, arguments: item);
          },
          child: GroceryItemTile(
            item: item,
            onToggleIsComplete: (value) => onToggleIsComplete(item.id, value, context),
          ),
        );
      },
    );
  }
}
