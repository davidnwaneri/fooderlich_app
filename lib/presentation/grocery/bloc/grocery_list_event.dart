part of 'grocery_list_bloc.dart';

abstract class GroceryListEvent extends Equatable {
  const GroceryListEvent();

  @override
  List<Object> get props => [];
}

class AddGroceryItem extends GroceryListEvent {
  final GroceryItem groceryItem;

  const AddGroceryItem({required this.groceryItem});

  @override
  List<Object> get props => [groceryItem];
}

class RemoveGroceryItem extends GroceryListEvent {
  final String id;

  const RemoveGroceryItem({required this.id});

  @override
  List<Object> get props => [id];
}

class EditGroceryItem extends GroceryListEvent {
  final GroceryItem groceryItem;

  const EditGroceryItem({required this.groceryItem});

  @override
  List<Object> get props => [groceryItem];
}

class MarkGroceryItemAsComplete extends GroceryListEvent {
  final String id;
  final bool condition;

  const MarkGroceryItemAsComplete({required this.id, required this.condition});

  @override
  List<Object> get props => [id, condition];
}
