import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/widgets/containers/home_container.dart';
import 'package:take_data_and_update_project/product/widgets/text/medium_text.dart';

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
      child: HomeContainer(
        width: 150,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            asset.image(width: 80.w, height: 60.h),
            AppSpacer.vertical.space15,
            MediumText(value: title),
          ],
        ),
      ),
    );
  }
}
