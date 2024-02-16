import 'package:flutter/material.dart';

abstract class CustomAppTheme {
  ThemeData get themeData;
  ColorScheme get colorScheme;
  TextTheme get textTheme;
  String get appFont;
  OutlineInputBorder outlineInputBorder(Color color);
  InputDecorationTheme get inputDecorationTheme;
  ElevatedButtonThemeData get elevatedButtonThemeData;
  CheckboxThemeData get checkboxThemeData;
  AppBarTheme get appBarTheme;
  DrawerThemeData get drawerThemeData;
  SnackBarThemeData get snackBarThemeData;
  ListTileThemeData get listTileThemeData;
  FloatingActionButtonThemeData get floatingActionButtonThemeData;
  DialogTheme get dialogTheme;
}
