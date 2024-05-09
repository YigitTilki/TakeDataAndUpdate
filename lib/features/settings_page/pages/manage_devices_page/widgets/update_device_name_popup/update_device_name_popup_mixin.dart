import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/manage_devices_page/widgets/update_device_name_popup/update_device_name_popup.dart';
import 'package:take_data_and_update_project/product/providers/device_list_provider.dart';
import 'package:take_data_and_update_project/product/service/devices_service.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

mixin UpdateDeviceNamePopUpMixin on ConsumerState<UpdateDeviceNamePopUp> {
  final TextEditingController updateDeviceNameController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    updateDeviceNameController.dispose();
  }

  Future<void> elevatedButtonProcess() async {
    scaffoldMessenger(context, 'Device Name Updated');
    await DeviceService().updateDeviceName(
      deviceId: widget.deviceModel.id.toString(),
      newDeviceName: updateDeviceNameController.text,
    );
    if (!mounted) return;
    await context.router.pop();
    ref.invalidate(userDeviceListProvider);
  }
}
