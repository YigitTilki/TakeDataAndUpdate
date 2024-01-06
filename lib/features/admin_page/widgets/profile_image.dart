part of '../admin_page.dart';

class _ProfileImage extends StatelessWidget {
  const _ProfileImage();

  @override
  Widget build(BuildContext context) {
    const profileIconSize = 80;
    return SizedBox(
      height: profileIconSize.h,
      width: profileIconSize.w,
      child: Assets.icons.adminIcon.image(
        width: profileIconSize.w,
        height: profileIconSize.h,
      ),
    );
  }
}
