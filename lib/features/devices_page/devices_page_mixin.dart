import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/devices_page/devices_page.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/providers/device_list_provider.dart';

mixin DevicesPageMixin on ConsumerState<DevicesPage> {
  final TextEditingController searchTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchTextController.dispose();
  }

  void searchOnChanged(String value) {
    final deviceListState = ref.watch(deviceListProvider);
    if (deviceListState is AsyncData<List<DeviceModel>>) {
      ref.read(deviceListNotifierProvider.notifier).filterUsers(
            value,
            deviceListState.value.toList(),
          );
      ref.invalidate(deviceListProvider);
    }
  }
}
