import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/widgets/pop_ups/base_pop_up.dart';

class ExitAppPopUp extends StatelessWidget {
  const ExitAppPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePopUp(
      title: LocaleKeys.popUps_exitApp,
      content: LocaleKeys.popUps_areYouSureExitApp,
      button1: LocaleKeys.popUps_yes,
      button2: LocaleKeys.popUps_no,
      icon: Assets.icons.logOutIcon,
      onPressed1: SystemNavigator.pop,
    );
  }
}
