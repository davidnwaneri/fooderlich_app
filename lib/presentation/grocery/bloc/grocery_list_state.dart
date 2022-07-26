part of 'grocery_list_bloc.dart';

abstract class GroceryListState extends Equatable {
  const GroceryListState([
    this.groceryList = const [],
  ]);

  final List<GroceryItem> groceryList;

  @override
  List<Object> get props => [groceryList];

  @override
  bool get stringify => true;
}

class GroceryListInitial extends GroceryListState {
  const GroceryListInitial([
    List<GroceryItem> groceryList = const [],
  ]) : super(groceryList);
}

class GroceryListLoading extends GroceryListState {
  const GroceryListLoading([
    List<GroceryItem> groceryList = const [],
  ]) : super(groceryList);
}

class GroceryListLoaded extends GroceryListState {

  const GroceryListLoaded(
    List<GroceryItem> groceryList,
  ) : super(groceryList);
}

class GroceryListError extends GroceryListState {
  final String error;
  const GroceryListError({
    List<GroceryItem> groceryList = const [],
    required this.error,
  }) : super(groceryList);

  @override
  List<Object> get props => [groceryList, error];
}
