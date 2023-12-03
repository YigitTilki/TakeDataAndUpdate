import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacer {
  AppSpacer._();
  static final vertical = _VerticalSpace();
  static final horizontal = _HorizontalSpace();
}

class _VerticalSpace {
  final SizedBox space10 = SizedBox(height: 10.h);
  final SizedBox space20 = SizedBox(height: 20.h);
  final SizedBox space100 = SizedBox(height: 100.h);
}

class _HorizontalSpace {
  final SizedBox space5 = SizedBox(width: 5.w);
}
