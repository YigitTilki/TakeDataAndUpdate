part of '../admin_page.dart';

class _DevicesContainer extends StatelessWidget {
  const _DevicesContainer();

  @override
  Widget build(BuildContext context) {
    const iconSize = 80;
    const gestureContainerWidth = 180;
    const gestureContainerHeight = 140;
    return GestureDetector(
      onTap: () {
        context.router.push(const DevicesRoute());
      },
      child: HomeContainer(
        width: gestureContainerWidth,
        height: gestureContainerHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.manageDeviceIcon.image(width: iconSize.w),
            AppSpacer.vertical.space20,
            const LargeText(value: LocaleKeys.usersPage_devices),
          ],
        ),
      ),
    );
  }
}
