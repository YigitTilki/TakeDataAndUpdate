import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/pop_scope.dart';
import 'package:take_data_and_update_project/product/widgets/text/large_text.dart';

class NoWifiPopUp extends StatelessWidget {
  const NoWifiPopUp({required this.navigator, super.key});
  final VoidCallback navigator;

  @override
  Widget build(BuildContext context) {
    return MyPopScope(
      child: AlertDialog(
        title: Assets.icons.noWifiIcon.image(height: 70.h),
        content: const LargeText(
          value: LocaleKeys.popUps_noInternetConnection,
        ),
        actions: [
          BorderedElevatedButton(
            onPressed: () {
              AppSettings.openAppSettings(
                type: AppSettingsType.wifi,
              );
            },
            text: LocaleKeys.popUps_wifiSettings,
          ),
          BorderedElevatedButton(
            onPressed: () async {
              final response = await Connectivity().checkConnectivity();
              if (response != ConnectivityResult.none) {
                navigator();
              }
            },
            text: LocaleKeys.popUps_tryAgain,
          ),
        ],
      ),
    );
  }
}
