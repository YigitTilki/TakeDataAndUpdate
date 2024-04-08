import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/devices_page/device_credentials_pop_up/device_credentials_pop_up.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/manage_devices_page/widgets/user_device_credentials_popup/user_device_credentials_popup_mixin.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';

class UserDeviceCredentialsPopUp extends ConsumerStatefulWidget {
  const UserDeviceCredentialsPopUp({required this.deviceModel, super.key});
  final DeviceModel deviceModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserDeviceCredentialsPopUpState();
}

class _UserDeviceCredentialsPopUpState
    extends ConsumerState<UserDeviceCredentialsPopUp>
    with UserDeviceCredentialsPopUpMixin {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      contentPadding:
          ProjectPadding.symHXXLarge() + ProjectPadding.topXXLarge(),
      content: _CredentialsContent(widget: widget),
      actions: [_actionButtons()],
    );
  }

  Row _actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: BorderedElevatedButton(
            onPressed: updateDeviceElevatedButtonProcess,
            text: 'Update Device Name',
          ),
        ),
        AppSpacer.horizontal.space10,
        Expanded(
          child: BorderedElevatedButton(
            onPressed: deleteDeviceElevatedButtonProcess,
            text: 'Delete Device',
          ),
        ),
      ],
    );
  }
}

class _CredentialsContent extends StatelessWidget {
  const _CredentialsContent({
    required this.widget,
  });

  final UserDeviceCredentialsPopUp widget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PopUpText(
            text1: LocaleKeys.devicesPage_deviceIdPopUp,
            text2: widget.deviceModel.id!,
          ),
          Divider(
            color: context.fourthColor,
          ),
          PopUpText(
            text1: LocaleKeys.devicesPage_deviceTypePopUp,
            text2: widget.deviceModel.type!,
          ),
          Divider(
            color: context.fourthColor,
          ),
          PopUpText(
            text1: LocaleKeys.devicesPage_createdDateByAdminPopUp,
            text2: widget.deviceModel.createdAtByAdmin!,
          ),
          Divider(
            color: context.fourthColor,
          ),
          PopUpText(
            text1: LocaleKeys.devicesPage_deviceStatusPopUp,
            text2: widget.deviceModel.isActive!
                ? LocaleKeys.devicesPage_active
                : LocaleKeys.devicesPage_passive,
          ),
          Divider(
            color: context.fourthColor,
          ),
          PopUpText(
            text1: LocaleKeys.devicesPage_createdDateByUserPopUp,
            text2: widget.deviceModel.createdAtByUser!,
          ),
          Divider(
            color: context.fourthColor,
          ),
          PopUpText(
            text1: LocaleKeys.devicesPage_userIdPopUP,
            text2: widget.deviceModel.userId!,
          ),
          Divider(
            color: context.fourthColor,
          ),
        ],
      ),
    );
  }
}
