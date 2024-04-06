import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/manage_devices_page/widgets/add_user_device/add_user_device.dart';
import 'package:take_data_and_update_project/product/providers/device_list_provider.dart';
import 'package:take_data_and_update_project/product/providers/user_providers.dart';
import 'package:take_data_and_update_project/product/service/devices_service.dart';
import 'package:take_data_and_update_project/product/util/wifi_connector.dart';

mixin AddUserDeviceMixin on ConsumerState<AddUserDeviceButton> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController deviceIdController = TextEditingController();
  final TextEditingController deviceNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    wifiConnector(context, ref);
  }

  @override
  void dispose() {
    super.dispose();
    deviceIdController.dispose();
    deviceNameController.dispose();
  }

  void clearControllers() {
    deviceIdController.clear();
    deviceNameController.clear();
  }

  Future<void> elevatedButtonProcess() async {
    if (!formKey.currentState!.validate()) {
      return debugPrint('Olmadı');
    } else {
      await DeviceService().verifyDeviceId(
        deviceIdController.text,
        widget.userModel.id!,
        deviceNameController.text,
        context,
      );
      ref
        ..invalidate(userDeviceListProvider)
        ..invalidate(deviceListProvider)
        ..invalidate(userListProvider);
    }
    if (!mounted) return;
    await context.router.pop();
    clearControllers();
  }
}
