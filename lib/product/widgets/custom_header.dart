import 'package:auto_route/auto_route.dart';
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
    this.iconButton,
  });
  final Widget icon;
  final String text;
  final IconButton? iconButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: Decorations.circleWithTwoColorDecoration(
            context.fourthColor,
            context.primaryColor,
          ),
          child: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        Container(
          width: 230.w,
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
        ),
        if (iconButton != null)
          Container(
            decoration: Decorations.circleWithTwoColorDecoration(
              context.fourthColor,
              context.primaryColor,
            ),
            child: iconButton,
          )
        else
          Padding(
            padding: ProjectPadding.allNormal(),
            child: SizedBox(
              width: 24.w,
            ),
          ),
      ],
    );
  }
}

class CustomHeaderOutBackButton extends StatelessWidget {
  const CustomHeaderOutBackButton({
    required this.icon,
    required this.text,
    super.key,
    this.iconButton,
  });
  final Widget icon;
  final String text;
  final IconButton? iconButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: ProjectPadding.allSmall(),
          child: SizedBox(
            width: 24.w,
          ),
        ),
        Container(
          width: 230.w,
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
        ),
        if (iconButton != null)
          Container(
            decoration: Decorations.circleWithTwoColorDecoration(
              context.fourthColor,
              context.primaryColor,
            ),
            child: iconButton,
          )
        else
          Padding(
            padding: ProjectPadding.allSmall(),
            child: SizedBox(
              width: 24.w,
            ),
          ),
      ],
    );
  }
}
