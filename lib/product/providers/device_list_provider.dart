import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/product/service/devices_service.dart';

final userDeviceListProvider = FutureProvider.family<List<String>, String>(
  (ref, userId) async {
    return DeviceService().getUserDevices(userId);
  },
);
