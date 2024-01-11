import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take_data_and_update_project/product/init/theme/blue_theme.dart';
import 'package:take_data_and_update_project/product/init/theme/light_theme.dart';

final themeProvider = ChangeNotifierProvider((ref) => ThemeNotifier());

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier() {
    _loadTheme();
  }
  static const String _themeKey = 'selectedTheme';
  SharedPreferences? _prefs;

  ThemeData _themeData = LightTheme().themeData;
  final ThemeData _darkThemeData = BlueTheme().themeData;

  ThemeData get themeData => _themeData;
  ThemeData get darkThemeData => _darkThemeData;

  Future<void> _loadTheme() async {
    _prefs = await SharedPreferences.getInstance();
    final savedThemeIndex = _prefs?.getInt(_themeKey);

    switch (savedThemeIndex) {
      case 0:
        _themeData = LightTheme().themeData;
      case 1:
        _themeData = BlueTheme().themeData;
      default:
        _themeData = LightTheme().themeData;
    }

    notifyListeners();
  }

  void _saveTheme(int themeIndex) {
    _prefs?.setInt(_themeKey, themeIndex);
  }

  void lightTheme() {
    _themeData = LightTheme().themeData;
    _saveTheme(0);
    notifyListeners();
  }

  void blueTheme() {
    _themeData = BlueTheme().themeData;
    _saveTheme(1);
    notifyListeners();
  }
}
