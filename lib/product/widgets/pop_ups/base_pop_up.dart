import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/text/large_text.dart';
import 'package:take_data_and_update_project/product/widgets/text/medium_text.dart';

class BasePopUp extends StatelessWidget {
  const BasePopUp({
    required this.title,
    required this.content,
    required this.button1,
    required this.button2,
    required this.icon,
    required this.onPressed1,
    super.key,
  });
  final String title;
  final String content;
  final String button1;
  final String button2;
  final AssetGenImage icon;
  final VoidCallback onPressed1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon.image(height: 30.h),
          LargeText(value: title),
          icon.image(height: 30.h),
        ],
      ),
      content: MediumText(value: content),
      actions: <Widget>[
        BorderedElevatedButton(
          text: button1,
          onPressed: onPressed1,
        ),
        BorderedElevatedButton(
          text: button2,
          onPressed: () {
            context.router.pop();
          },
        ),
      ],
    );
  }
}
