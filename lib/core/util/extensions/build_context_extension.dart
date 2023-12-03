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

  //TextStyles
  TextStyle? get headLineLarge => textTheme.headlineLarge;
  TextStyle? get headLineSmall => textTheme.headlineSmall;
  TextStyle? get labelLarge => textTheme.labelLarge;
  TextStyle? get labelMedium => textTheme.labelMedium;
  TextStyle? get labelSmall => textTheme.labelSmall;
  TextStyle? get clickableLabelSmall => textTheme.titleSmall;
  TextStyle? get errorLabelSmall => textTheme.bodySmall;
}
