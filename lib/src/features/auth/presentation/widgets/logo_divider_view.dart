import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/core/constants/app_colors.dart';
import 'package:take_data_and_update_project/core/constants/app_string.dart';
import 'package:take_data_and_update_project/core/util/app_spacer.dart';
import 'package:take_data_and_update_project/core/util/extensions/build_context_extension.dart';

class LogoDividerView extends StatelessWidget {
  const LogoDividerView({super.key});

  @override
  Widget build(BuildContext context) {
    const int dividerWidth = 270;
    const int dividerHeight = 2;

    return Column(
      children: [
        AppSpacer.vertical.space20,
        Text(
          AppString.logo,
          style: context.displayMedium?.copyWith(color: AppColors.blackColor),
        ),
        AppSpacer.vertical.space20,
        Container(
          width: dividerWidth.w,
          height: dividerHeight.h,
          color: context.blackColor,
        ),
      ],
    );
  }
}
