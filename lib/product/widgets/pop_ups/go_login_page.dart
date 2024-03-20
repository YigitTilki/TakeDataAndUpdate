import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/widgets/pop_ups/base_pop_up.dart';

class GoLoginPagePopUp extends StatelessWidget {
  const GoLoginPagePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePopUp(
      title: LocaleKeys.popUps_goToLoginPage,
      content: LocaleKeys.popUps_areYouSureGoLogin,
      button1: LocaleKeys.popUps_yes,
      button2: LocaleKeys.popUps_no,
      icon: Assets.icons.forgotPasswordIcon,
      onPressed1: () {
        context.router.push(const LoginRoute());
      },
    );
  }
}
