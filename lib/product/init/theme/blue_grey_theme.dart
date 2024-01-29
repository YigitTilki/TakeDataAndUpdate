import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/base/base_app_theme.dart';
import 'package:take_data_and_update_project/product/util/asset/fonts.gen.dart';

class BlueGreyTheme implements CustomAppTheme {
  //Dark Theme Colors
  static const Color homeBackgroundColor = Color(0xFFF1F0E8);
  static const Color secondaryColor = Color(0xFF96B6C5);
  static const Color tertiaryColor = Color(0xFFCCE6F1);
  static const Color fourthColor = Color(0xFFEEE0C9);

  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color onErrorColor = Color.fromARGB(255, 90, 26, 174);
  static const Color errorColor = Color.fromARGB(255, 50, 13, 99);
  static const Color clickableColor = Colors.blueGrey;
  static const Color defaultTextColor = Colors.black;

  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: homeBackgroundColor,
        appBarTheme: appBarTheme,
        drawerTheme: drawerThemeData,
        snackBarTheme: snackBarThemeData,
        colorScheme: colorScheme,
        fontFamily: appFont,
        textTheme: textTheme,
        elevatedButtonTheme: elevatedButtonThemeData,
        inputDecorationTheme: inputDecorationTheme,
        checkboxTheme: checkboxThemeData,
        listTileTheme: listTileThemeData,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        dialogTheme: const DialogTheme(), //TODO: add dialog theme
      );

  @override
  AppBarTheme get appBarTheme => AppBarTheme(
        color: homeBackgroundColor,
        titleTextStyle: textTheme.headlineLarge,
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: secondaryColor, size: 30.sp),
        iconTheme: IconThemeData(color: secondaryColor, size: 30.sp),
      );

  @override
  String get appFont => FontFamily.josefinSans;

  @override
  CheckboxThemeData get checkboxThemeData => CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith(
          (states) => secondaryColor,
        ),
        checkColor: MaterialStateProperty.resolveWith(
          (states) => tertiaryColor,
        ),
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(
            color: tertiaryColor,
            width: 1.sp,
          ),
        ),
      );

  @override
  ColorScheme get colorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: homeBackgroundColor,
        onPrimary: fourthColor,
        secondary: secondaryColor,
        onSecondary: homeBackgroundColor,
        tertiary: tertiaryColor,
        error: errorColor,
        onError: onErrorColor,
        background: homeBackgroundColor,
        onBackground: homeBackgroundColor,
        surface: blackColor,
        onSurface: defaultTextColor,
        scrim: clickableColor,
      );

  @override
  DrawerThemeData get drawerThemeData => DrawerThemeData(
        backgroundColor: homeBackgroundColor,
        width: 242.w,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 10.sp, color: secondaryColor),
        ),
      );

  @override
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: whiteColor,
          backgroundColor: homeBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.sp),
          ),
          textStyle: textTheme.labelMedium,
        ),
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      FloatingActionButtonThemeData(
        iconSize: 25.sp,
        backgroundColor: homeBackgroundColor,
        foregroundColor: defaultTextColor,
      );

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        enabledBorder: outlineInputBorder(homeBackgroundColor),
        focusedBorder: outlineInputBorder(tertiaryColor),
        errorBorder: outlineInputBorder(errorColor),
        focusedErrorBorder: outlineInputBorder(onErrorColor),
        errorStyle: textTheme.titleLarge?.copyWith(color: errorColor),
        filled: true,
        fillColor: fourthColor,
        hintStyle: textTheme.headlineSmall?.copyWith(color: secondaryColor),
      );

  @override
  ListTileThemeData get listTileThemeData => ListTileThemeData(
        subtitleTextStyle: textTheme.titleLarge,
        titleTextStyle: textTheme.bodyMedium,
      );

  @override
  SnackBarThemeData get snackBarThemeData => SnackBarThemeData(
        actionTextColor: fourthColor,
        backgroundColor: homeBackgroundColor,
        contentTextStyle: textTheme.labelMedium,
      );

  @override
  TextTheme get textTheme => TextTheme(
        labelSmall: TextStyle(
          fontSize: 7.sp,
          color: defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          fontSize: 8.sp,
          color: defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          fontSize: 9.sp,
          color: defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          fontSize: 10.sp,
          color: defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          fontSize: 11.sp,
          color: defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          fontSize: 12.sp,
          color: defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontSize: 13.sp,
          color: defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          color: defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          fontSize: 15.sp,
          color: defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          fontSize: 16.sp,
          color: defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          fontSize: 18.sp,
          color: defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        headlineLarge: TextStyle(
          fontSize: 20.sp,
          color: defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        displaySmall: TextStyle(
          fontSize: 24.sp,
          color: defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        displayMedium: TextStyle(
          fontSize: 32.sp,
          color: defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
        displayLarge: TextStyle(
          fontSize: 36.sp,
          color: defaultTextColor,
          fontWeight: FontWeight.w500,
        ),
      );

  @override
  OutlineInputBorder outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.sp),
      borderSide: BorderSide(color: color, width: 2.sp),
    );
  }
}
