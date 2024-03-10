import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';
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
    const iconSize = 30;
    return AlertDialog(
      title: _Title(title: title, icon: icon, iconSize: iconSize),
      content: _Content(content: content),
      contentPadding: EdgeInsets.zero + ProjectPadding.symVMedium(),
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

class _Title extends StatelessWidget {
  const _Title({
    required this.title,
    required this.icon,
    required this.iconSize,
  });

  final String title;
  final AssetGenImage icon;
  final int iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LargeText(value: title),
        AppSpacer.horizontal.space10,
        icon.image(height: iconSize.w),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      decoration: Decorations.popUPBorderContainerDecoration(
        context.tertiaryColor,
        context.fourthColor,
      ),
      child: Padding(
        padding: ProjectPadding.allMedium(),
        child: MediumText(value: content),
      ),
    );
  }
}
