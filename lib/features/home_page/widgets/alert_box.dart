part of '../home_page.dart';

class _AlertBox extends StatelessWidget {
  const _AlertBox({
    required this.bigContainerWidth,
    required this.smallContainerHeight,
  });

  final int bigContainerWidth;
  final int smallContainerHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: HomeContainer(
        width: bigContainerWidth,
        height: smallContainerHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Assets.icons.overheatIcon.image(width: 70.w, height: 62.h),
            const LargeText(value: LocaleKeys.homePage_alertBox),
          ],
        ),
      ),
    );
  }
}
