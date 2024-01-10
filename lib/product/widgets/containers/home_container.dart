import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {required this.child,
      required this.width,
      required this.height,
      super.key});
  final Widget child;
  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: Decorations.borderContainerDecoration(
        context.primaryColor,
        context.fourthColor,
      ),
      child: child,
    );
  }
}
