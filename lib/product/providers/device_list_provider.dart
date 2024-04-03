import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/service/devices_service.dart';

final deviceListProvider = FutureProvider<List<DeviceModel>>((ref) async {
  return DeviceService().getDevices();
});
final userDeviceListProvider = FutureProvider.family<List<String>, String>(
  (ref, userId) async {
    return DeviceService().getUserDevices(userId);
  },
);
final deleteDeviceProvider =
    FutureProvider.family<void, String>((ref, deviceId) async {
  await DeviceService().deleteDevice(deviceId: deviceId);
  ref.invalidate(deviceListProvider);
});

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
