import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/devices_page/device_credentials_pop_up.dart';
import 'package:take_data_and_update_project/product/providers/device_list_provider.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

mixin ConfigDeviceMixin on ConsumerState<DeviceCredentialsPopUp> {
  Future<void> updateButtonProcess() async {}
  Future<void> getUserCredentialsButtonProcess() async {}

  Future<void> deleteButtonProcess() async {
    ref.read(deleteDeviceProvider(widget.deviceModel.id!));
    scaffoldMessenger(context, 'DeviceDeleted');
    await context.router.pop();
  }
}
