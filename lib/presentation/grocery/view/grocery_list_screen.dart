// packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
// views
import 'package:fooderlich_app/api/models/grocery_item.dart';
import 'grocery_item_tile.dart';
//
import '../bloc/grocery_list_bloc.dart';
import 'package:fooderlich_app/navigation/app_router.gr.dart';

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
        return Dismissible(
          key: Key(item.id),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: const Icon(Icons.delete_forever, color: Colors.white, size: 50.0),
          ),
          onDismissed: (direction) {
            context.read<GroceryListBloc>().add(RemoveGroceryItem(id: item.id));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${item.name} deleted'),
              ),
            );
          },
          child: InkWell(
            onTap: () {
              context.router.push(EditGroceryItemRouter(groceryItemToEdit: item));
            },
            child: GroceryItemTile(
              item: item,
              onToggleIsComplete: (value) => onToggleIsComplete(item.id, value, context),
            ),
          ),
        );
      },
    );
  }
}
