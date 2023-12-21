import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class ProjectPadding extends EdgeInsets {
  ///All Lines Padding
  ProjectPadding.allXXSmall() : super.all(2.sp);
  ProjectPadding.allXSmall() : super.all(4.sp);
  ProjectPadding.allSmall() : super.all(8.sp);
  ProjectPadding.allMedium() : super.all(10.sp);
  ProjectPadding.allNormal() : super.all(12.sp);
  ProjectPadding.allLarge() : super.all(14.sp);
  ProjectPadding.allXLarge() : super.all(16.sp);
  ProjectPadding.allXXLarge() : super.all(20.sp);

  ///Horizontal Padding
  ProjectPadding.symHXXSmall() : super.symmetric(horizontal: 2.w);
  ProjectPadding.symHXSmall() : super.symmetric(horizontal: 4.w);
  ProjectPadding.symHSmall() : super.symmetric(horizontal: 8.w);
  ProjectPadding.symHMedium() : super.symmetric(horizontal: 10.w);
  ProjectPadding.symHNormal() : super.symmetric(horizontal: 12.w);
  ProjectPadding.symHLarge() : super.symmetric(horizontal: 14.w);
  ProjectPadding.symHXLarge() : super.symmetric(horizontal: 16.w);
  ProjectPadding.symHXXLarge() : super.symmetric(horizontal: 20.w);

  ///Vertical Padding
  ProjectPadding.symVXXSmall() : super.symmetric(vertical: 2.h);
  ProjectPadding.symVXSmall() : super.symmetric(vertical: 4.h);
  ProjectPadding.symVSmall() : super.symmetric(vertical: 8..h);
  ProjectPadding.symVMedium() : super.symmetric(vertical: 10.h);
  ProjectPadding.symVNormal() : super.symmetric(vertical: 12.h);
  ProjectPadding.symVLarge() : super.symmetric(vertical: 14.h);
  ProjectPadding.symVXLarge() : super.symmetric(vertical: 16.h);
  ProjectPadding.symVXXLarge() : super.symmetric(vertical: 20.h);
}
