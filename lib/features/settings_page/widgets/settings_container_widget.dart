import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';
import 'package:take_data_and_update_project/product/widgets/text/settings_page_text.dart';

class SettingsContainerWidget extends StatelessWidget {
  const SettingsContainerWidget({
    required this.title,
    required this.asset,
    required this.onPressed,
    super.key,
  });
  final String title;
  final AssetGenImage asset;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150.w,
        height: 150.h,
        decoration: Decorations.borderContainerDecoration(
          context.primaryColor,
          context.fourthColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            asset.image(width: 80.w, height: 60.h),
            AppSpacer.vertical.space15,
            SettingsPageText(value: title),
          ],
        ),
      ),
    );
  }
}
