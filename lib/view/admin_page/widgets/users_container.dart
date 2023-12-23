part of '../admin_page.dart';

class _UsersContainer extends StatelessWidget {
  const _UsersContainer();

  @override
  Widget build(BuildContext context) {
    const int iconSize = 90;
    const int gestureContainerWidth = 290;
    const int gestureContainerHeight = 130;
    const int textBox = 160;
    return GestureDetector(
      onTap: () {
        context.router.push(const UsersRoute());
      },
      child: Container(
        width: gestureContainerWidth.w,
        height: gestureContainerHeight.h,
        decoration: containerDecoration(context.primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppSpacer.horizontal.space20,
            Assets.images.users.image(
              width: iconSize.w,
              height: iconSize.h,
            ),
            AppSpacer.horizontal.space20,
            Expanded(
              child: SizedBox(
                width: textBox.w,
                child: Text(
                  LocaleKeys.adminPage_users,
                  style: context.displaySmall,
                ).tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
