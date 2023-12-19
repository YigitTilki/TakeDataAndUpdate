import 'package:flutter/material.dart';

extension BuildContextExtansion on BuildContext {
  //Schemes
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  //Colors
  Color get primaryColor => colorScheme.primary;
  Color get secondaryColor => colorScheme.secondary;
  Color get blackColor => colorScheme.surface;
  Color get tertiarityColor => colorScheme.tertiary;
  Color get fourthColor => colorScheme.onPrimary;
  Color get errorColor => colorScheme.error;
  Color get onErrorColor => colorScheme.onError;

  //TextStyles
  TextStyle? get labelSmall => textTheme.labelSmall;
  TextStyle? get labelMedium => textTheme.labelMedium;
  TextStyle? get labelLarge => textTheme.labelLarge;
  TextStyle? get titleSmall => textTheme.titleSmall;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get bodySmall => textTheme.bodySmall;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get headlineSmall => textTheme.headlineSmall;
  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get displaySmall => textTheme.displaySmall;
  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displayLarge => textTheme.displayLarge;
}
