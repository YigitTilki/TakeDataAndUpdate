part of 'devices_page.dart';

class _DeviceCredentialsPopUP extends StatelessWidget {
  const _DeviceCredentialsPopUP({required this.deviceModel});
  final DeviceModel deviceModel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      contentPadding:
          ProjectPadding.symHXXLarge() + ProjectPadding.topXXLarge(),
      shape: Decorations.popUpDecoration(
        context.fourthColor,
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PopUpText(
              device1: LocaleKeys.devicesPage_deviceIdPopUp,
              device2: deviceModel.id!,
            ),
            Divider(
              color: context.fourthColor,
            ),
            _PopUpText(
              device1: LocaleKeys.devicesPage_deviceTypePopUp,
              device2: deviceModel.type!,
            ),
            Divider(
              color: context.fourthColor,
            ),
            _PopUpText(
              device1: LocaleKeys.devicesPage_createdDateByAdminPopUp,
              device2: deviceModel.createdAtByAdmin ?? 'Unassigned',
            ),
            Divider(
              color: context.fourthColor,
            ),
            _PopUpText(
              device1: LocaleKeys.devicesPage_isDeviceActivePopUp,
              device2: deviceModel.isActive!
                  ? LocaleKeys.devicesPage_active
                  : LocaleKeys.devicesPage_passive,
            ),
            Divider(
              color: context.fourthColor,
            ),
            if (deviceModel.isActive!)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _PopUpText(
                    device1: LocaleKeys.devicesPage_createdDateByUserPopUp,
                    device2: deviceModel.createdAtByUser!,
                  ),
                  Divider(
                    color: context.fourthColor,
                  ),
                  _PopUpText(
                    device1: LocaleKeys.devicesPage_userIdPopUP,
                    device2: deviceModel.userId!,
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
      ),
      actions: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  //TODO: is it necessary
                  child: BorderedElevatedButton(
                    onPressed: () {},
                    text: LocaleKeys.devicesPage_updateDevice,
                  ),
                ),
                AppSpacer.horizontal.space10,
                Expanded(
                  //TODO: is it necessary
                  child: BorderedElevatedButton(
                    onPressed: () {},
                    text: LocaleKeys.devicesPage_deleteDevice,
                  ),
                ),
              ],
            ),
            AppSpacer.vertical.space5,
            if (deviceModel.isActive!)
              BorderedElevatedButton(
                onPressed: () {},
                text: LocaleKeys.devicesPage_getUserCredentials,
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ],
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
          TextSpan(text: device2, style: context.bodySmall),
        ],
      ),
    );
  }
}
