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
            RichText(
              text: TextSpan(
                text: 'Device Id :\n  ',
                style:
                    context.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: deviceModel.id, style: context.bodySmall),
                ],
              ),
            ),
            Divider(
              color: context.fourthColor,
            ),
            RichText(
              text: TextSpan(
                text: 'Device Type :\n  ',
                style:
                    context.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: deviceModel.type, style: context.bodySmall),
                ],
              ),
            ),
            Divider(
              color: context.fourthColor,
            ),
            RichText(
              text: TextSpan(
                text: 'User Id :\n  ',
                style:
                    context.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: deviceModel.userId ?? 'Not Assigned Yet',
                    style: context.bodySmall,
                  ),
                ],
              ),
            ),
            Divider(
              color: context.fourthColor,
            ),
            RichText(
              text: TextSpan(
                text: 'Is Device Active :\n  ',
                style:
                    context.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: deviceModel.isActive! ? 'Active' : 'Passive',
                    style: context.bodySmall,
                  ),
                ],
              ),
            ),
            Divider(
              color: context.fourthColor,
            ),
            RichText(
              text: TextSpan(
                text: 'Created Date By Admin :\n  ',
                style:
                    context.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: deviceModel.createdAtByAdmin,
                    style: context.bodySmall,
                  ),
                ],
              ),
            ),
            Divider(
              color: context.fourthColor,
            ),
            RichText(
              text: TextSpan(
                text: 'Created Date By User :\n  ',
                style:
                    context.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: deviceModel.createdAtByUser ?? 'Not Created Yet',
                    style: context.bodySmall,
                  ),
                ],
              ),
            ),
            Divider(
              color: context.fourthColor,
            ),
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
                    text: "Update Device",
                  ),
                ),
                AppSpacer.horizontal.space10,
                Expanded(
                  //TODO: is it necessary
                  child: BorderedElevatedButton(
                    onPressed: () {},
                    text: "Delete Device",
                  ),
                ),
              ],
            ),
            AppSpacer.vertical.space5,
            BorderedElevatedButton(
              onPressed: () {},
              text: "Get User Credentials",
            ),
          ],
        ),
      ],
    );
  }
}
