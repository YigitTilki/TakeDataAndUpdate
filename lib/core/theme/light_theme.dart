import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LightTheme {
  LightTheme._();

  static const Color homeBackgroundColor = Color(0xFFB68C6D);
  static const Color secondaryColor = Color(0xFFE5B18C);
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color tertiarityColor = Color(0xFF855D40);
  static const Color onErrorColor = Color(0xFFE3242B);
  static const Color errorColor = Color(0xFF990F02);
  static const Color fourthColor = Color(0xFFFFD4B6);
  static const Color clickebleColor = Color(0xFFA15C1C);

  static ColorScheme get _colorScheme => const ColorScheme(
      brightness: Brightness.light,
      primary: homeBackgroundColor,
      onPrimary: fourthColor,
      secondary: secondaryColor,
      onSecondary: homeBackgroundColor,
      error: errorColor,
      onError: onErrorColor,
      background: homeBackgroundColor,
      onBackground: homeBackgroundColor,
      surface: blackColor,
      onSurface: homeBackgroundColor);

  static String get _appFont => "Inter";

  static TextTheme get _appTextTheme => const TextTheme(
        headlineLarge: TextStyle(
          color: blackColor,
          fontSize: 32,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: whiteColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          color: secondaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        labelMedium: TextStyle(
          color: whiteColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: tertiarityColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          color: clickebleColor,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: errorColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      );

  static OutlineInputBorder _outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.sp),
      borderSide: BorderSide(color: color, width: 2.sp),
    );
  }

  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
      enabledBorder: _outlineInputBorder(homeBackgroundColor),
      focusedBorder: _outlineInputBorder(tertiarityColor),
      errorBorder: _outlineInputBorder(errorColor),
      focusedErrorBorder: _outlineInputBorder(onErrorColor),
      errorStyle: _appTextTheme.bodySmall,
      filled: true,
      fillColor: fourthColor,
      labelStyle: _appTextTheme.labelLarge,
      hintStyle: _appTextTheme.labelLarge);

  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            foregroundColor: whiteColor,
            backgroundColor: tertiarityColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.sp),
            ),
            textStyle: _appTextTheme.labelMedium),
      );

  static CheckboxThemeData get _checkBoxThemeData => CheckboxThemeData(
        fillColor:
            MaterialStateProperty.resolveWith((states) => secondaryColor),
        checkColor:
            MaterialStateProperty.resolveWith((states) => tertiarityColor),
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(
            color: tertiarityColor,
            width: 1.sp,
          ),
        ),
      );

  static AppBarTheme get _appBarTheme => AppBarTheme(
        color: homeBackgroundColor,
        titleTextStyle: _appTextTheme.headlineSmall,
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: secondaryColor, size: 30.sp),
        iconTheme: IconThemeData(color: secondaryColor, size: 30.sp),
      );

  static DrawerThemeData get _drawerThemeData => DrawerThemeData(
        backgroundColor: homeBackgroundColor,
        width: 242.w,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 10.sp, color: secondaryColor),
        ),
      );

  static SnackBarThemeData get _snackBarThemeData => SnackBarThemeData(
      actionTextColor: fourthColor,
      backgroundColor: homeBackgroundColor,
      contentTextStyle: _appTextTheme.labelMedium);
  static ThemeData get themeData {
    return ThemeData(
        scaffoldBackgroundColor: homeBackgroundColor,
        appBarTheme: _appBarTheme,
        drawerTheme: _drawerThemeData,
        snackBarTheme: _snackBarThemeData,
        colorScheme: _colorScheme,
        fontFamily: _appFont,
        textTheme: _appTextTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        inputDecorationTheme: _inputDecorationTheme,
        checkboxTheme: _checkBoxThemeData);
  }
}
