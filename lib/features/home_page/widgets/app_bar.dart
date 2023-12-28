part of '../home_page.dart';

class _HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final UserModel userModel;
  const _HomePageAppBar(this.userModel);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "${LocaleKeys.homePage_welcome.tr()} ${userModel.firstName} ${userModel.lastName}",
      ), //TODO: take name
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
