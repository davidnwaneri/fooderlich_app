import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(const BottomNavigationState());

  /// Given an index, navigates to the corresponding [BottomNavigationBarItem].
  void changeToIndex(int index) {
    emit(BottomNavigationState(index));
  }

  /// Navigates to the [RecipeView], which is at index 1, the second [BottomNavigationBarItem].
  void goToRecipes() => changeToIndex(1);
}
