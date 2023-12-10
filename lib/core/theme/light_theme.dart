import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/core/constants/app_colors.dart';

class LightTheme {
  LightTheme._();

  static ColorScheme get _colorScheme => const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.homeBackgroundColor,
      onPrimary: AppColors.fourthColor,
      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.homeBackgroundColor,
      error: AppColors.errorColor,
      onError: AppColors.onErrorColor,
      background: AppColors.homeBackgroundColor,
      onBackground: AppColors.homeBackgroundColor,
      surface: AppColors.blackColor,
      onSurface: AppColors.defaultTextColor);

  static String get _appFont => "Inter";

  static TextTheme get _appTextTheme => TextTheme(
        labelSmall: TextStyle(
          fontSize: 7.sp,
          color: AppColors.defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          fontSize: 8.sp,
          color: AppColors.defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          fontSize: 9.sp,
          color: AppColors.defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          fontSize: 10.sp,
          color: AppColors.defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          fontSize: 11.sp,
          color: AppColors.defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          fontSize: 12.sp,
          color: AppColors.defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontSize: 13.sp,
          color: AppColors.defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          color: AppColors.defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          fontSize: 15.sp,
          color: AppColors.defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          fontSize: 16.sp,
          color: AppColors.defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          fontSize: 18.sp,
          color: AppColors.defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        headlineLarge: TextStyle(
          fontSize: 20.sp,
          color: AppColors.defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        displaySmall: TextStyle(
          fontSize: 24.sp,
          color: AppColors.defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        displayMedium: TextStyle(
          fontSize: 32.sp,
          color: AppColors.defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        displayLarge: TextStyle(
          fontSize: 36.sp,
          color: AppColors.defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
      );

  static OutlineInputBorder _outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.sp),
      borderSide: BorderSide(color: color, width: 2.sp),
    );
  }

  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        enabledBorder: _outlineInputBorder(AppColors.homeBackgroundColor),
        focusedBorder: _outlineInputBorder(AppColors.tertiarityColor),
        errorBorder: _outlineInputBorder(AppColors.errorColor),
        focusedErrorBorder: _outlineInputBorder(AppColors.onErrorColor),
        errorStyle:
            _appTextTheme.titleLarge?.copyWith(color: AppColors.errorColor),
        filled: true,
        fillColor: AppColors.fourthColor,
        hintStyle: _appTextTheme.headlineSmall
            ?.copyWith(color: AppColors.secondaryColor),
      );

  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.whiteColor,
            backgroundColor: AppColors.tertiarityColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.sp),
            ),
            textStyle: _appTextTheme.labelMedium),
      );

  static CheckboxThemeData get _checkBoxThemeData => CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith(
            (states) => AppColors.secondaryColor),
        checkColor: MaterialStateProperty.resolveWith(
            (states) => AppColors.tertiarityColor),
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(
            color: AppColors.tertiarityColor,
            width: 1.sp,
          ),
        ),
      );

  static AppBarTheme get _appBarTheme => AppBarTheme(
        color: AppColors.homeBackgroundColor,
        titleTextStyle: _appTextTheme.headlineLarge,
        centerTitle: true,
        actionsIconTheme:
            IconThemeData(color: AppColors.secondaryColor, size: 30.sp),
        iconTheme: IconThemeData(color: AppColors.secondaryColor, size: 30.sp),
      );

  static DrawerThemeData get _drawerThemeData => DrawerThemeData(
        backgroundColor: AppColors.homeBackgroundColor,
        width: 242.w,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 10.sp, color: AppColors.secondaryColor),
        ),
      );

  static SnackBarThemeData get _snackBarThemeData => SnackBarThemeData(
      actionTextColor: AppColors.fourthColor,
      backgroundColor: AppColors.homeBackgroundColor,
      contentTextStyle: _appTextTheme.labelMedium);

  static ListTileThemeData get _listTileThemeData => ListTileThemeData(
        subtitleTextStyle: _appTextTheme.titleLarge,
        titleTextStyle: _appTextTheme.bodyMedium,
      );

  static FloatingActionButtonThemeData get _floatingActionButtonThemeData =>
      FloatingActionButtonThemeData(
        iconSize: 25.sp,
        backgroundColor: AppColors.homeBackgroundColor,
      );

  static ThemeData get themeData {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.homeBackgroundColor,
        appBarTheme: _appBarTheme,
        drawerTheme: _drawerThemeData,
        snackBarTheme: _snackBarThemeData,
        colorScheme: _colorScheme,
        fontFamily: _appFont,
        textTheme: _appTextTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        inputDecorationTheme: _inputDecorationTheme,
        checkboxTheme: _checkBoxThemeData,
        listTileTheme: _listTileThemeData,
        floatingActionButtonTheme: _floatingActionButtonThemeData);
  }
}
