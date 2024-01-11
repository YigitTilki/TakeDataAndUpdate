import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';

class ThemeChangerContainer extends StatelessWidget {
  const ThemeChangerContainer({
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
    super.key,
  });
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;

  @override
  Widget build(BuildContext context) {
    const colorContainerWidth = 20;
    const colorContainerHeight = 80;

    return Container(
      decoration: Decorations.borderContainerDecoration(
        context.difColor,
        context.fourthColor,
      ),
      width: 150.w,
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: colorContainerHeight.h,
            width: colorContainerWidth.w,
            color: color1,
          ),
          Container(
            height: colorContainerHeight.h,
            width: colorContainerWidth.w,
            color: color2,
          ),
          Container(
            height: colorContainerHeight.h,
            width: colorContainerWidth.w,
            color: color3,
          ),
          Container(
            height: colorContainerHeight.h,
            width: colorContainerWidth.w,
            color: color3,
          ),
        ],
      ),
    );
  }
}
