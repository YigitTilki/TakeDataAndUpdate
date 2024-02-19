part of '../home_page.dart';

class _MyDevices extends StatelessWidget {
  const _MyDevices({
    required this.bigContainerWidth,
    required this.bigContainerHeight,
  });

  final int bigContainerWidth;
  final int bigContainerHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: HomeContainer(
        width: bigContainerWidth,
        height: bigContainerHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.phoneIcon.image(
              width: 120.w,
              height: 120.h,
            ),
            AppSpacer.vertical.space5,
            const LargeText(value: LocaleKeys.homePage_myDevices),
          ],
        ),
      ),
    );
  }
}
