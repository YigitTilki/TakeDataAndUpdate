part of '../admin_page.dart';

class _ProfileImage extends StatelessWidget {
  const _ProfileImage();

  @override
  Widget build(BuildContext context) {
    const int profileIconSize = 100;
    return SizedBox(
      height: profileIconSize.h,
      width: profileIconSize.w,
      child: const CircleAvatar(
        backgroundImage: AssetImage(ImageHelper.profileIcon),
      ),
    );
  }
}
