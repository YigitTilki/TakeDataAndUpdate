import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/devices_page/device_credentials_pop_up/config_device_mixin.dart';
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

  Row _actions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BorderedElevatedButton(
          onPressed: deleteButtonProcess,
          text: LocaleKeys.devicesPage_deleteDevice,
        ),
        AppSpacer.horizontal.space10,
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
          if (widget.deviceModel.isActive!)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
            )
          else
            const SizedBox.shrink(),
          AppSpacer.vertical.space10,
        ],
      ),
    );
  }
}

class PopUpText extends StatelessWidget {
  const PopUpText({
    required this.text1,
    required this.text2,
    super.key,
  });

  final String text2;
  final String text1;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1.tr(),
        style: context.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(text: text2.tr(), style: context.bodySmall),
        ],
      ),
    );
  }
}
