import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/manage_devices_page/widgets/update_device_name_popup/update_device_name_popup.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/manage_devices_page/widgets/user_device_credentials_popup/user_device_credentials_popup.dart';
import 'package:take_data_and_update_project/product/providers/device_list_provider.dart';
import 'package:take_data_and_update_project/product/service/devices_service.dart';
import 'package:take_data_and_update_project/product/util/show_dialog.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

mixin UserDeviceCredentialsPopUpMixin
    on ConsumerState<UserDeviceCredentialsPopUp> {
  Future<void> deleteDeviceElevatedButtonProcess() async {
    scaffoldMessenger(
      context,
      'Device Deleted From Your Devices',
    );
    await DeviceService().deleteDeviceFromUser(
      deviceId: widget.deviceModel.id.toString(),
    );
    if (!context.mounted) return;
    await context.router.pop();
    ref.invalidate(
      userDeviceListProvider,
    );
  }

  Future<void> updateDeviceElevatedButtonProcess() async {
    await context.router.pop();
    if (!context.mounted) return;
    await showBottom(
      context: context,
      widget: UpdateDeviceNamePopUp(
        deviceModel: widget.deviceModel,
      ),
    );
  }
}
