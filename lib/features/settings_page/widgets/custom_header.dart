import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';
import 'package:take_data_and_update_project/product/widgets/text/settings_page_text.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    required this.icon,
    required this.text,
    super.key,
  });
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      height: 50.h,
      decoration: Decorations.borderContainerDecoration(
        context.primaryColor,
        context.fourthColor,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: ProjectPadding.symVSmall(),
              child: icon,
            ),
            SettingsPageText(
              value: text,
            ),
            Padding(
              padding: ProjectPadding.symVSmall(),
              child: icon,
            ),
          ],
        ),
      ),
    );
  }
}
