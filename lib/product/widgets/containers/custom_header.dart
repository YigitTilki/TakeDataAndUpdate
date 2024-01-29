import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';
import 'package:take_data_and_update_project/product/widgets/text/medium_text.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    required this.icon,
    required this.text,
    required this.needBackButton,
    this.iconButton,
    super.key,
  });
  final Widget icon;
  final String text;
  final IconButton? iconButton;
  final bool needBackButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ///Back Button
        if (needBackButton)
          const _ArrowBackButton()
        else
          const _EmptySizePadding(),

        ///Main Container
        _MainContainer(icon: icon, text: text),

        ///Custom Trailing Button
        if (iconButton != null)
          _CustomIconButton(iconButton: iconButton)
        else
          const _EmptySizePadding(),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton({
    required this.iconButton,
  });

  final IconButton? iconButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.circleWithTwoColorDecoration(
        context.fourthColor,
        context.primaryColor,
      ),
      child: iconButton,
    );
  }
}

class _EmptySizePadding extends StatelessWidget {
  const _EmptySizePadding();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.allNormal(),
      child: SizedBox(
        width: 24.w,
      ),
    );
  }
}

class _MainContainer extends StatelessWidget {
  const _MainContainer({
    required this.icon,
    required this.text,
  });

  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Expanded(
              child: Padding(
                padding: ProjectPadding.symVSmall(),
                child: icon,
              ),
            ),
            Expanded(
              flex: 2,
              child: MediumText(
                value: text,
              ),
            ),
            Expanded(
              child: Padding(
                padding: ProjectPadding.symVSmall(),
                child: icon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArrowBackButton extends StatelessWidget {
  const _ArrowBackButton();

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
