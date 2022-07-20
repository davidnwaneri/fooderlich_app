import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(const BottomNavigationState());

  void changeToIndex(int index) {
    emit(BottomNavigationState(index));
  }
}
