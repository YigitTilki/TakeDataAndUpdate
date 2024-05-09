import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/product/models/data_model.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';

abstract class BaseDeviceService {
  Future<void> addDevice({required DeviceModel deviceModel});
  Future<void> setDeviceToUser({
    required String deviceId,
    required String userID,
    required String deviceName,
    required BuildContext context,
  });
  Future<DeviceModel?> getDevice({required String deviceId});
  Future<List<DeviceModel>> getDevices();
  Stream<List<DataModel>> getDeviceData({
    required String deviceId,
    required String dateTime,
  });
  Future<List<String>> getUserDevices({required String userId});
  Future<List<String>> getDeviceTypes();
  Future<void> updateDeviceName({
    required String deviceId,
    required String newDeviceName,
  });
  Future<void> deleteDevice({required String deviceId});
  Future<void> deleteDeviceFromUser({required String deviceId});
}
