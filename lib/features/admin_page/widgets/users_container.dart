part of '../admin_page.dart';

class _UsersContainer extends StatelessWidget {
  const _UsersContainer();

  @override
  Widget build(BuildContext context) {
    const iconSize = 90;
    const gestureContainerWidth = 290;
    const gestureContainerHeight = 130;
    const textBox = 160;
    return GestureDetector(
      onTap: () {
        context.router.push(const UsersRoute());
      },
      child: Container(
        width: gestureContainerWidth.w,
        height: gestureContainerHeight.h,
        decoration: Decorations.containerDecoration(context.primaryColor),
        child: Row(
          children: [
            AppSpacer.horizontal.space20,
            Assets.images.users.image(
              width: iconSize.w,
              height: iconSize.h,
              color: context.secondaryColor,
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
