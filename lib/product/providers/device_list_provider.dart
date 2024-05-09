import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/service/devices_service.dart';
import 'package:take_data_and_update_project/product/util/date_time.dart';

final deviceListProvider = FutureProvider<List<DeviceModel>>((ref) async {
  return DeviceService().getDevices();
});
final userDeviceListProvider = FutureProvider.family<List<String>, String>(
  (ref, userId) async {
    return DeviceService().getUserDevices(userId: userId);
  },
);
final getDeviceProvider = FutureProvider.family<DeviceModel?, String>(
  (ref, deviceId) async {
    final deviceModel = await DeviceService().getDevice(deviceId: deviceId);
    return deviceModel;
  },
);
final deleteDeviceProvider =
    FutureProvider.family<void, String>((ref, deviceId) async {
  await DeviceService().deleteDevice(deviceId: deviceId);
  ref.invalidate(deviceListProvider);
});
final selectedDateProvider =
    StateProvider<String>((ref) => MyDateTime().getDate());

final deviceListNotifierProvider =
    StateNotifierProvider<UserListNotifier, AsyncValue<List<DeviceModel>>>(
  (ref) => UserListNotifier(),
);

class UserListNotifier extends StateNotifier<AsyncValue<List<DeviceModel>>> {
  UserListNotifier() : super(const AsyncLoading());

  void filterUsers(String value, List<DeviceModel> devices) {
    state = AsyncData(
      devices
          .where(
            (device) =>
                (device.id != null &&
                    device.id!.toLowerCase().contains(value.toLowerCase())) ||
                (device.userId != null &&
                    device.userId!.toLowerCase().contains(value.toLowerCase())),
          )
          .toList(),
    );
  }
}
