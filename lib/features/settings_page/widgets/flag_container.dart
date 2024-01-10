part of '../pages/change_language_page.dart';

class _FlagContainer extends StatelessWidget {
  const _FlagContainer({
    required this.language,
    required this.image,
    required this.flagText,
  });
  final Locales language;
  final AssetGenImage image;
  final String flagText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            ProductLocalizations.updateLanguage(
              context: context,
              value: language,
            );
          },
          child: Container(
            width: 100.w,
            height: 80.h,
            padding: ProjectPadding.allSmall(),
            decoration: Decorations.borderContainerDecoration(
              context.primaryColor,
              context.fourthColor,
            ),
            child: Container(
              decoration: Decorations.circleWithBorderDecoration(
                context.fourthColor,
              ),
              child: image.image(),
            ),
          ),
        ),
        AppSpacer.vertical.space5,
        Text(
          flagText.tr(),
          style: context.bodyLarge,
        ),
      ],
    );
  }
}
