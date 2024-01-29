part of '../admin_page.dart';

class _UsersContainer extends StatelessWidget {
  const _UsersContainer();

  @override
  Widget build(BuildContext context) {
    const iconSize = 80;
    const gestureContainerWidth = 180;
    const gestureContainerHeight = 140;
    return GestureDetector(
      onTap: () {
        context.router.push(const UsersRoute());
      },
      child: HomeContainer(
        width: gestureContainerWidth,
        height: gestureContainerHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppSpacer.horizontal.space20,
            Assets.icons.adminUsersIcon.image(
              width: iconSize.w,
              height: iconSize.h,
            ),
            AppSpacer.horizontal.space20,
            const LargeText(
              value: LocaleKeys.adminPage_users,
            ),
          ],
        ),
      ),
    );
  }
}
