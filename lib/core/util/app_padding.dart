import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPadding {
  AppPadding._();
  static final vertical = _Vertical();
  static final horizontal = _Horizontal();
}

class _Vertical {
  final double xSmallPadding = 2.0.h;
  final double extraSmallPadding = 4.0.h;
  final double smallPadding = 14.0.h;
  final double mediumPadding = 16.0.h;
  final double largePadding = 18.0.h;
  final double extraLargePadding = 20.0.h;
  final double superLargePadding = 24.0.h;
  final double megaLargePadding = 28.0.h;
  final double ultraLargePadding = 32.0.h;
  final double xLargePadding = 48.0.h;
  final double xxLargePadding = 60.0.h;
  final double xxxLPadding = 90.0.h;
}

class _Horizontal {
  final double xSmallPadding = 2.0.w;
  final double extraSmallPadding = 4.0.w;
  final double smallPadding = 8.0.w;
  final double mediumPadding = 12.0.w;
  final double largePadding = 18.0.w;
  final double extraLargePadding = 20.0.w;
  final double superLargePadding = 24.0.w;
  final double megaLargePadding = 28.0.w;
  final double ultraLargePadding = 32.0.w;
  final double xLargePadding = 48.0.w;
  final double xxLargePadding = 60.0.w;
  final double xxxLPadding = 90.0.w;
}
