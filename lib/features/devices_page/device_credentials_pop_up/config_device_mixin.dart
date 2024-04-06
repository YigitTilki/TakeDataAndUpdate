import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/devices_page/device_credentials_pop_up/device_credentials_pop_up.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/providers/device_list_provider.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/util/show_dialog.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

mixin ConfigDeviceMixin on ConsumerState<DeviceCredentialsPopUp> {
  Future<void> getUserCredentialsButtonProcess() async {
    final userModel =
        await AuthRepository().getUserWithId(id: widget.deviceModel.userId!);
    if (!mounted) return;
    await show(
      context,
      AlertDialog(
        content: Column(
          children: [
            PopUpText(
              text1: LocaleKeys.devicesPage_userIdPopUP,
              text2: userModel!.id!,
            ),
            PopUpText(
              text1: LocaleKeys.registerPage_firstName,
              text2: userModel.firstName!,
            ),
            PopUpText(
              text1: LocaleKeys.registerPage_firstName,
              text2: userModel.lastName!,
            ),
            PopUpText(
              text1: LocaleKeys.registerPage_firstName,
              text2: userModel.email!,
            ),
            PopUpText(
              text1: LocaleKeys.registerPage_firstName,
              text2: userModel.devices!.toString(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteButtonProcess() async {
    ref.read(deleteDeviceProvider(widget.deviceModel.id!));
    scaffoldMessenger(context, 'DeviceDeleted');
    await context.router.pop();
  }
}
