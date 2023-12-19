import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/init/theme/dark_theme.dart';
import 'package:take_data_and_update_project/init/theme/light_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => LightTheme.themeData;
  static ThemeData get darkTheme => DarkTheme.themeData;
}
