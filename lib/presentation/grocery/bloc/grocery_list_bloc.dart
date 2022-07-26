import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fooderlich_app/api/models/models.dart';

part 'grocery_list_event.dart';
part 'grocery_list_state.dart';

class GroceryListBloc extends Bloc<GroceryListEvent, GroceryListState> {
  GroceryListBloc() : super(const GroceryListInitial()) {
    on<AddGroceryItem>(_onAddGroceryItem);
    on<RemoveGroceryItem>(_onRemoveGroceryItem);
    on<EditGroceryItem>(_onEditGroceryItem);
    on<MarkGroceryItemAsComplete>(_onMarkGroceryItemAsComplete);
  }

  void _onAddGroceryItem(AddGroceryItem event, Emitter<GroceryListState> emit) {
    final groceryList = [...state.groceryList, event.groceryItem];
    emit(GroceryListLoaded(
      groceryList,
    ));
  }

  void _onRemoveGroceryItem(RemoveGroceryItem event, Emitter<GroceryListState> emit) {
    emit(GroceryListLoaded(
      state.groceryList
          .where(
            (groceryItem) => groceryItem.id != event.id,
          )
          .toList(),
    ));
  }

  void _onEditGroceryItem(EditGroceryItem event, Emitter<GroceryListState> emit) {
    emit(GroceryListLoaded(
      state.groceryList
          .map(
            (groceryItem) => groceryItem.id == event.groceryItem.id
                ? event.groceryItem
                : groceryItem,
          )
          .toList(),
    ));
  }

  void _onMarkGroceryItemAsComplete(MarkGroceryItemAsComplete event, Emitter<GroceryListState> emit) {
    emit(GroceryListLoaded(
      state.groceryList
          .map((groceryItem) => groceryItem.id == event.id
              ? groceryItem.copyWith(
                  isComplete: event.condition,
                )
              : groceryItem)
          .toList(),
    ));
  }
}
