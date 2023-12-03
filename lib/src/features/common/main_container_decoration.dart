import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ShapeDecoration containerDecoration(context) {
  const int borderRadius = 15;

  return ShapeDecoration(
    color: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius.sp),
    ),
  );
}
