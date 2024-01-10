part of '../settings_page.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      icon: Assets.icons.settingsIcon.svg(),
      text: LocaleKeys.settingsPage_settingsLower,
    );
  }
}
