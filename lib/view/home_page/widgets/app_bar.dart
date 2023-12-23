part of '../home_page.dart';

class _HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomePageAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "${LocaleKeys.homePage_welcome.tr()} displayName",
      ), //TODO: take name
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
