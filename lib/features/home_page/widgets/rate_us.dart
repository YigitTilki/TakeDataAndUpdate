part of '../home_page.dart';

class _RateUs extends StatelessWidget {
  const _RateUs({
    required this.smallContainerWidth,
    required this.smallContainerHeight,
  });

  final int smallContainerWidth;
  final int smallContainerHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: HomeContainer(
        width: smallContainerWidth,
        height: smallContainerHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LargeText(value: LocaleKeys.homePage_rateUs),
            AppSpacer.vertical.space10,
            Assets.icons.starsIcon.svg(),
          ],
        ),
      ),
    );
  }
}
