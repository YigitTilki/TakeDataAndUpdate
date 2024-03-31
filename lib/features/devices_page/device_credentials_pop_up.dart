import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/devices_page/config_device_mixin.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';

class DeviceCredentialsPopUp extends ConsumerStatefulWidget {
  const DeviceCredentialsPopUp({required this.deviceModel, super.key});
  final DeviceModel deviceModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DeviceCredentialsPopUpState();
}

class _DeviceCredentialsPopUpState extends ConsumerState<DeviceCredentialsPopUp>
    with ConfigDeviceMixin {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      contentPadding:
          ProjectPadding.symHXXLarge() + ProjectPadding.topXXLarge(),
      shape: Decorations.popUpDecoration(
        context.fourthColor,
      ),
      content: _Content(widget: widget),
      actions: [
        _actions(),
      ],
    );
  }

  Column _actions() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: BorderedElevatedButton(
                onPressed: updateButtonProcess,
                text: LocaleKeys.devicesPage_updateDevice,
              ),
            ),
            AppSpacer.horizontal.space10,
            Expanded(
              child: BorderedElevatedButton(
                onPressed: deleteButtonProcess,
                text: LocaleKeys.devicesPage_deleteDevice,
              ),
            ),
          ],
        ),
        AppSpacer.vertical.space5,
        if (widget.deviceModel.isActive!)
          BorderedElevatedButton(
            onPressed: getUserCredentialsButtonProcess,
            text: LocaleKeys.devicesPage_getUserCredentials,
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.widget,
  });

  final DeviceCredentialsPopUp widget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PopUpText(
            device1: LocaleKeys.devicesPage_deviceIdPopUp,
            device2: widget.deviceModel.id!,
          ),
          Divider(
            color: context.fourthColor,
          ),
          _PopUpText(
            device1: LocaleKeys.devicesPage_deviceTypePopUp,
            device2: widget.deviceModel.type!,
          ),
          Divider(
            color: context.fourthColor,
          ),
          _PopUpText(
            device1: LocaleKeys.devicesPage_createdDateByAdminPopUp,
            device2: widget.deviceModel.createdAtByAdmin!,
          ),
          Divider(
            color: context.fourthColor,
          ),
          _PopUpText(
            device1: LocaleKeys.devicesPage_deviceStatusPopUp,
            device2: widget.deviceModel.isActive!
                ? LocaleKeys.devicesPage_active
                : LocaleKeys.devicesPage_passive,
          ),
          Divider(
            color: context.fourthColor,
          ),
          if (widget.deviceModel.isActive!)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PopUpText(
                  device1: LocaleKeys.devicesPage_createdDateByUserPopUp,
                  device2: widget.deviceModel.createdAtByUser!,
                ),
                Divider(
                  color: context.fourthColor,
                ),
                _PopUpText(
                  device1: LocaleKeys.devicesPage_userIdPopUP,
                  device2: widget.deviceModel.userId!,
                ),
                Divider(
                  color: context.fourthColor,
                ),
              ],
            )
          else
            const SizedBox.shrink(),
          AppSpacer.vertical.space10,
        ],
      ),
    );
  }
}

class _PopUpText extends StatelessWidget {
  const _PopUpText({
    required this.device1,
    required this.device2,
  });

  final String device2;
  final String device1;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: device1.tr(),
        style: context.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(text: device2.tr(), style: context.bodySmall),
        ],
      ),
    );
  }
}
