import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/devices_page/add_device_button/add_device_button.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/providers/device_list_provider.dart';
import 'package:take_data_and_update_project/product/service/devices_service.dart';
import 'package:take_data_and_update_project/product/util/date_time.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

mixin AddDevicesMixin on ConsumerState<AddDeviceButton> {
  final TextEditingController deviceIdController = TextEditingController();
  String? deviceType;

  @override
  void dispose() {
    super.dispose();
    deviceIdController.dispose();
  }

  void clearController() {
    deviceIdController.clear();
  }

  Future<void> elevatedButtonProcess() async {
    if (deviceType == null) {
      scaffoldMessenger(context, 'Must be Type');
      await context.router.pop();
    } else {
      await DeviceService().addDevice(
        DeviceModel(
          id: deviceIdController.text,
          type: deviceType,
          isActive: false,
          createdAtByAdmin: MyDateTime().getDateTime(),
        ),
      );
      ref.invalidate(deviceListProvider);
      clearController();
      if (!context.mounted) return;
      await context.router.pop();
    }
  }
}
