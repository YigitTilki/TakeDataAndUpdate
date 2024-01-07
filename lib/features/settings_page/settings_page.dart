import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/settings_page/widgets/settings_container_widget.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({required this.userModel, super.key});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    const iconSize = 25;
    return Scaffold(
      backgroundColor: context.secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 250.w,
            height: 50.h,
            decoration: Decorations.borderContainerDecoration(
              context.primaryColor,
              context.fourthColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Assets.icons.settingsIcon.svg(
                  width: iconSize.w,
                  height: iconSize.h,
                ),
                Text(LocaleKeys.settingsPage_settingsLower.tr()),
                Assets.icons.settingsIcon.svg(
                  width: iconSize.w,
                  height: iconSize.h,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SettingsContainerWidget(
                onPressed: () {
                  context.router.push(EditUserRoute(userModel: userModel));
                },
                title: LocaleKeys.settingsPage_editUser.tr(),
                asset: Assets.icons.updateProfileIcon,
              ),
              SettingsContainerWidget(
                onPressed: () {},
                title: LocaleKeys.settingsPage_manageDevices.tr(),
                asset: Assets.icons.manageDeviceIcon,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SettingsContainerWidget(
                onPressed: () {
                  context.router.push(const ChangeLanguageRoute());
                },
                title: LocaleKeys.settingsPage_changeLanguage.tr(),
                asset: Assets.icons.changeLanguageIcon,
              ),
              SettingsContainerWidget(
                onPressed: () {},
                title: LocaleKeys.settingsPage_notificationSettings.tr(),
                asset: Assets.icons.notificationSettingsIcon,
              ),
            ],
          ),
          SettingsContainerWidget(
            onPressed: () {},
            title: LocaleKeys.settingsPage_logOut.tr(),
            asset: Assets.icons.logOutIcon,
          ),
        ],
      ),
    );
  }
}
