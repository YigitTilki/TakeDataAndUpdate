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
}
