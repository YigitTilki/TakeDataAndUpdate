import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/text/header_text.dart';

class LogoDividerView extends StatelessWidget {
  const LogoDividerView({super.key});

  @override
  Widget build(BuildContext context) {
    const dividerWidth = 270;
    const dividerHeight = 3;

    return Column(
      children: [
        AppSpacer.vertical.space20,
        const HeaderText(value: LocaleKeys.commons_logo),
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
