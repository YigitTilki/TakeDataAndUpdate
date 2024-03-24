import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/manage_devices_page.dart';
import 'package:take_data_and_update_project/product/util/wifi_connector.dart';

mixin ManageDevicesMixin on ConsumerState<ManageDevicesPage> {
  @override
  void initState() {
    super.initState();
    wifiConnector(context, ref);
  }
}
