import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  void toggleDarkThemeMode(bool value) {
    if(value){
      emit(const ThemeState(themeMode: ThemeMode.dark));
    }else{
      emit(const ThemeState(themeMode: ThemeMode.light));
    }
  }
}
