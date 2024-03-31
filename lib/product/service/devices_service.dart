import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:take_data_and_update_project/product/enums/firebase_enums.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/util/date_time.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

class DeviceService {
  final Logger logger = Logger();

  Future<void> addDevice(DeviceModel deviceModel) async {
    try {
      final deviceModelMap = deviceModel.toJson();
      await devicesCollection.doc(deviceModel.id).set(deviceModelMap);
    } catch (exception) {
      print(exception);
    }
  }

  Future<List<DeviceModel>> getDevices() async {
    try {
      final querySnapshot = await devicesCollection.get();
      final deviceList = <DeviceModel>[];

      for (final doc in querySnapshot.docs) {
        final device =
            DeviceModel.fromJson(doc.data()! as Map<String, dynamic>);
        deviceList.add(device);
      }

      return deviceList;
    } catch (error) {
      logger.d('Error during getDevices : $error');
      return [];
    }
  }

  Future<List<String>> getUserDevices(String userId) async {
    final deviceList = await usersCollection.doc(userId).get();
    final data = deviceList.data() as Map<String, dynamic>?;
    if (data != null && data[devicesField] != null) {
      final devices = data[devicesField] as List<dynamic>;
      return devices.map((device) => device.toString()).toList();
    } else {
      return [];
    }
  }

  Future<void> deleteDevice({required String deviceId}) async {
    final deviceData = await devicesCollection.doc(deviceId).get();
    final userID = deviceData[userIdField];

    if (userID == null) {
      await devicesCollection.doc(deviceId).delete();
      logger.d('Device Deleted');
    } else {
      final userDevices = await getUserDevices(userID.toString());
      userDevices.removeWhere((element) => element == deviceId);
      await usersCollection.doc(userID.toString()).update({
        'devices': userDevices,
      });
      logger.d("Device Removed from User's Device List");

      await devicesCollection.doc(deviceId).delete();
      logger.d('Device Deleted');
    }
  }

  Future<List<String>> getDeviceTypes() async {
    final types = await deviceTypesCollection.get();
    final typesList = <String>[];
    for (final doc in types.docs) {
      final fieldValue = doc.get(typeField) as String;
      typesList.add(fieldValue);
    }
    return typesList;
  }

  Future<void> verifyDeviceId(
    String deviceId,
    String userID,
    BuildContext context,
  ) async {
    try {
      final deviceSnapshot = await devicesCollection.doc(deviceId).get();
      final dateTime = MyDateTime().getDateTime();
      if (deviceSnapshot.exists) {
        final userId = (deviceSnapshot.data()!
                as Map<String, dynamic>)[userIdField] as String? ??
            '';
        if (userId.isEmpty) {
          await usersCollection.doc(userID).update({
            devicesField: FieldValue.arrayUnion([deviceId]),
          });
          await devicesCollection.doc(deviceId).update({
            userIdField: userID,
            createdAtByUserField: dateTime,
            isActiveField: true,
          });
        } else {
          scaffoldMessenger(context, 'Wrong ID');
        }
      } else {
        scaffoldMessenger(context, 'Wrong ID');
      }
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }
}
