import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/product/enums/firebase_enums.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

class DeviceService {
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
          await devicesCollection
              .doc(deviceId)
              .set(DeviceModel(userId: userID, id: deviceId).toJson());
        } else {
          scaffoldMessenger(context, 'Wrong ID');
        }
      } else {
        scaffoldMessenger(context, 'Wrong ID');
      }
    } catch (exception) {
      print(exception);
    }
  }
}
