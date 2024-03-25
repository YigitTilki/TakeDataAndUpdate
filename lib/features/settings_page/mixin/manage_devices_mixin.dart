import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/manage_devices_page.dart';
import 'package:take_data_and_update_project/product/providers/device_list_provider.dart';
import 'package:take_data_and_update_project/product/service/devices_service.dart';
import 'package:take_data_and_update_project/product/util/wifi_connector.dart';

mixin ManageDevicesMixin on ConsumerState<ManageDevicesPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController deviceIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    wifiConnector(context, ref);
  }

  @override
  void dispose() {
    super.dispose();
    deviceIdController.dispose();
  }

  Future<void> elevatedButtonProcess() async {
    await DeviceService()
        .verifyDeviceId(deviceIdController.text, widget.userModel.id!, context);
    ref.invalidate(userDeviceListProvider);
  }
}
