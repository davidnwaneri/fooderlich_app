part of 'recipe_bloc.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class LoadRecipes extends RecipeEvent {
  const LoadRecipes();
}
