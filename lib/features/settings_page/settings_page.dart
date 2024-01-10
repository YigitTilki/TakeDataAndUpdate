import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/settings_page/widgets/custom_header.dart';
import 'package:take_data_and_update_project/features/settings_page/widgets/settings_container_widget.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({required this.userModel, super.key});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.secondaryColor,
      body: Padding(
        padding: ProjectPadding.topLarge(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const _Header(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _EditUser(userModel: userModel),
                const _ManageDevices(),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ChangeLanguage(),
                _NotificationSettings(),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ChangeTheme(),
                _LogOut(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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

class _LogOut extends StatelessWidget {
  const _LogOut();

  @override
  Widget build(BuildContext context) {
    return SettingsContainerWidget(
      onPressed: () {},
      title: LocaleKeys.settingsPage_logOut.tr(),
      asset: Assets.icons.logOutIcon,
    );
  }
}

class _ChangeTheme extends StatelessWidget {
  const _ChangeTheme();

  @override
  Widget build(BuildContext context) {
    return SettingsContainerWidget(
      onPressed: () {},
      title: LocaleKeys.settingsPage_changeTheme,
      asset: Assets.icons.changeThemeIcon,
    );
  }
}

class _NotificationSettings extends StatelessWidget {
  const _NotificationSettings();

  @override
  Widget build(BuildContext context) {
    return SettingsContainerWidget(
      onPressed: () {},
      title: LocaleKeys.settingsPage_notificationSettings,
      asset: Assets.icons.notificationSettingsIcon,
    );
  }
}

class _ChangeLanguage extends StatelessWidget {
  const _ChangeLanguage();

  @override
  Widget build(BuildContext context) {
    return SettingsContainerWidget(
      onPressed: () {
        context.router.push(const ChangeLanguageRoute());
      },
      title: LocaleKeys.settingsPage_changeLanguage,
      asset: Assets.icons.changeLanguageIcon,
    );
  }
}

class _ManageDevices extends StatelessWidget {
  const _ManageDevices();

  @override
  Widget build(BuildContext context) {
    return SettingsContainerWidget(
      onPressed: () {},
      title: LocaleKeys.settingsPage_manageDevices,
      asset: Assets.icons.manageDeviceIcon,
    );
  }
}

class _EditUser extends StatelessWidget {
  const _EditUser({
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return SettingsContainerWidget(
      onPressed: () {
        context.router.push(EditUserRoute(userModel: userModel));
      },
      title: LocaleKeys.settingsPage_editUser,
      asset: Assets.icons.updateProfileIcon,
    );
  }
}
