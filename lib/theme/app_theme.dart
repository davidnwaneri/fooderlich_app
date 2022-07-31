import 'package:flutter/material.dart';

enum AppTheme {
  defaultt,
  light,
  dark,
}

class FooderlichAppTheme {
  static final appTheme = {
    AppTheme.defaultt: ThemeData(
      brightness: Brightness.light
    ),
    AppTheme.light: ThemeData(
      brightness: Brightness.light,
    ),
    AppTheme.dark: ThemeData(
      brightness: Brightness.dark,
    ),
  };
}
