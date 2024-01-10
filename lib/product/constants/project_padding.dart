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

  //Only Right Padding
  ProjectPadding.rightXXSmall() : super.only(right: 2.w);
  ProjectPadding.rightXSmall() : super.only(right: 4.w);
  ProjectPadding.rightSmall() : super.only(right: 8.w);
  ProjectPadding.rightMedium() : super.only(right: 10.w);
  ProjectPadding.rightNormal() : super.only(right: 12.w);
  ProjectPadding.rightLarge() : super.only(right: 14.w);
  ProjectPadding.rightXLarge() : super.only(right: 16.w);
  ProjectPadding.rightXXLarge() : super.only(right: 20.w);

  //Only Left Padding
  ProjectPadding.leftXXSmall() : super.only(left: 2.w);
  ProjectPadding.leftXSmall() : super.only(left: 4.w);
  ProjectPadding.leftSmall() : super.only(left: 8.w);
  ProjectPadding.leftMedium() : super.only(left: 10.w);
  ProjectPadding.leftNormal() : super.only(left: 12.w);
  ProjectPadding.leftLarge() : super.only(left: 14.w);
  ProjectPadding.leftXLarge() : super.only(left: 16.w);
  ProjectPadding.leftXXLarge() : super.only(left: 20.w);
}
