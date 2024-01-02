import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/util/constants/app_colors.dart';
import 'package:take_data_and_update_project/util/constants/app_spacer.dart';
import 'package:take_data_and_update_project/util/extensions/build_context_extension.dart';

class LogoDividerView extends StatelessWidget {
  const LogoDividerView({super.key});

  @override
  Widget build(BuildContext context) {
    const dividerWidth = 270;
    const dividerHeight = 2;

    return Column(
      children: [
        AppSpacer.vertical.space20,
        Text(
          LocaleKeys.commons_logo,
          style: context.displayMedium?.copyWith(color: AppColors.blackColor),
        ).tr(),
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
