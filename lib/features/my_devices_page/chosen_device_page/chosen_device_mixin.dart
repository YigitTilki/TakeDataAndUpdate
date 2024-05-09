import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:take_data_and_update_project/features/my_devices_page/chosen_device_page/chosen_device_page.dart';
import 'package:take_data_and_update_project/product/providers/device_list_provider.dart';
import 'package:take_data_and_update_project/product/util/wifi_connector.dart';

mixin ChosenDevicePageMixin on ConsumerState<ChosenDevicePage> {
  @override
  void initState() {
    super.initState();
    wifiConnector(context, ref);
  }

  Future<void> datePicker() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (date == null) {
      return;
    } else {
      final dateFormatter = DateFormat('dd.MM.yyyy');
      final myDate = dateFormatter.format(date);
      ref.read(selectedDateProvider.notifier).state = myDate;
    }
  }
}
