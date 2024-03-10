import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class Decorations {
  Decorations._();
  static int borderRadius = 15;

  static ShapeDecoration containerDecoration(Color context) {
    return ShapeDecoration(
      color: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius.sp),
      ),
    );
  }

  static RoundedRectangleBorder popUpDecoration(Color context) {
    return RoundedRectangleBorder(
      side: BorderSide(
        width: 8.sp,
        color: context,
      ),
      borderRadius: BorderRadius.circular(borderRadius.sp),
    );
  }

  static ShapeDecoration borderContainerDecoration(
    Color containerColor,
    Color borderColor,
  ) {
    return ShapeDecoration(
      color: containerColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 4.sp,
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(borderRadius.sp),
      ),
    );
  }

  static ShapeDecoration popUPBorderContainerDecoration(
    Color containerColor,
    Color borderColor,
  ) {
    return ShapeDecoration(
      color: containerColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 4.sp,
          color: borderColor,
        ),
      ),
    );
  }

  static ShapeDecoration circleWithBorderDecoration(Color borderColor) {
    return ShapeDecoration(
      shape: CircleBorder(
        side: BorderSide(width: 2.sp, color: borderColor),
      ),
    );
  }

  static ShapeDecoration circleWithTwoColorDecoration(
    Color borderColor,
    Color containerColor,
  ) {
    return ShapeDecoration(
      color: containerColor,
      shape: CircleBorder(
        side: BorderSide(width: 4.sp, color: borderColor),
      ),
    );
  }
}
