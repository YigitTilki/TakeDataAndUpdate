import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/init/theme/app_theme.dart';
import 'package:take_data_and_update_project/product/util/asset/fonts.gen.dart';
import 'package:take_data_and_update_project/product/util/constants/app_colors.dart';

final class LightTheme implements CustomAppTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.homeBackgroundColor,
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
        color: AppColors.homeBackgroundColor,
        titleTextStyle: textTheme.headlineLarge,
        centerTitle: true,
        actionsIconTheme:
            IconThemeData(color: AppColors.secondaryColor, size: 30.sp),
        iconTheme: IconThemeData(color: AppColors.secondaryColor, size: 30.sp),
      );

  @override
  String get appFont => FontFamily.inter;

  @override
  CheckboxThemeData get checkboxThemeData => CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith(
          (states) => AppColors.secondaryColor,
        ),
        checkColor: MaterialStateProperty.resolveWith(
          (states) => AppColors.tertiaryColor,
        ),
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(
            color: AppColors.tertiaryColor,
            width: 1.sp,
          ),
        ),
      );

  @override
  ColorScheme get colorScheme => const ColorScheme(
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
        onSurface: AppColors.defaultTextColor,
      );

  @override
  DrawerThemeData get drawerThemeData => DrawerThemeData(
        backgroundColor: AppColors.homeBackgroundColor,
        width: 242.w,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 10.sp, color: AppColors.secondaryColor),
        ),
      );

  @override
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.whiteColor,
          backgroundColor: AppColors.tertiaryColor,
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
        backgroundColor: AppColors.homeBackgroundColor,
      );

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        enabledBorder: outlineInputBorder(AppColors.homeBackgroundColor),
        focusedBorder: outlineInputBorder(AppColors.tertiaryColor),
        errorBorder: outlineInputBorder(AppColors.errorColor),
        focusedErrorBorder: outlineInputBorder(AppColors.onErrorColor),
        errorStyle: textTheme.titleLarge?.copyWith(color: AppColors.errorColor),
        filled: true,
        fillColor: AppColors.fourthColor,
        hintStyle:
            textTheme.headlineSmall?.copyWith(color: AppColors.secondaryColor),
      );

  @override
  ListTileThemeData get listTileThemeData => ListTileThemeData(
        subtitleTextStyle: textTheme.titleLarge,
        titleTextStyle: textTheme.bodyMedium,
      );

  @override
  SnackBarThemeData get snackBarThemeData => SnackBarThemeData(
        actionTextColor: AppColors.fourthColor,
        backgroundColor: AppColors.homeBackgroundColor,
        contentTextStyle: textTheme.labelMedium,
      );

  @override
  TextTheme get textTheme => TextTheme(
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

  @override
  OutlineInputBorder outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.sp),
      borderSide: BorderSide(color: color, width: 2.sp),
    );
  }
}
