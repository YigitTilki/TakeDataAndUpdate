part of '../change_theme_page.dart';

class ChangeThemeContainer extends StatelessWidget {
  const ChangeThemeContainer({
    required this.theme,
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.fourthColor,
    required this.text,
    required this.selectedOne,
    super.key,
  });
  final VoidCallback theme;
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color fourthColor;
  final String text;
  final bool selectedOne;

  @override
  Widget build(BuildContext context) {
    const colorContainerWidth = 20;
    const colorContainerHeight = 80;
    return Column(
      children: [
        GestureDetector(
          onTap: theme,
          child: Container(
            decoration: Decorations.borderContainerDecoration(
              context.difColor,
              selectedOne ? Colors.green : context.fourthColor,
            ),
            width: 150.w,
            height: 100.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: colorContainerHeight.h,
                  width: colorContainerWidth.w,
                  color: primaryColor,
                ),
                Container(
                  height: colorContainerHeight.h,
                  width: colorContainerWidth.w,
                  color: secondaryColor,
                ),
                Container(
                  height: colorContainerHeight.h,
                  width: colorContainerWidth.w,
                  color: tertiaryColor,
                ),
                Container(
                  height: colorContainerHeight.h,
                  width: colorContainerWidth.w,
                  color: fourthColor,
                ),
              ],
            ),
          ),
        ),
        AppSpacer.vertical.space5,
        MediumText(
          value: text,
        ),
      ],
    );
  }
}
