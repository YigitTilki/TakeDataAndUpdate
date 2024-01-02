// ignore_for_file: lines_longer_than_80_chars

part of '../home_page.dart';

class _HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomePageAppBar(this.userModel);
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        '${LocaleKeys.homePage_welcome.tr()} ${userModel.firstName} ${userModel.lastName}',
      ), //TODO: take name
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
