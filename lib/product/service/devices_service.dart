import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/product/enums/firebase_enums.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

class DeviceService {
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

  Future<void> verifyDeviceId(
    String deviceId,
    String userID,
    BuildContext context,
  ) async {
    try {
      final deviceSnapshot = await devicesCollection.doc(deviceId).get();
      if (deviceSnapshot.exists) {
        final userId = (deviceSnapshot.data()!
                as Map<String, dynamic>)[userIdField] as String? ??
            '';
        if (userId.isEmpty) {
          await usersCollection.doc(userID).update({
            devicesField: FieldValue.arrayUnion([deviceId]),
          });
          await devicesCollection.doc(deviceId).update({userIdField: userID});
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
