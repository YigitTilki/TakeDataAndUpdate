import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/product/base/base_device_service.dart';
import 'package:take_data_and_update_project/product/enums/firebase_enums.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/data_model.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/util/date_time.dart';
import 'package:take_data_and_update_project/product/util/version_manager.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

class DeviceService extends BaseDeviceService {
  @override
  Future<void> addDevice({required DeviceModel deviceModel}) async {
    try {
      final deviceModelMap = deviceModel.toJson();
      await devicesCollection.doc(deviceModel.id).set(deviceModelMap);
      logger.d('Device Added');
    } catch (e) {
      logger.d(
        'Add Device Error: $e',
      );
    }
  }

  @override
  Future<void> updateDeviceName({
    required String deviceId,
    required String newDeviceName,
  }) async {
    try {
      await devicesCollection
          .doc(deviceId)
          .update({deviceNameField: newDeviceName});
      logger.d('Device Name Updated');
    } catch (e) {
      logger.d(
        'Update Device Name Error: $e',
      );
    }
  }

  @override
  Future<DeviceModel?> getDevice({required String deviceId}) async {
    try {
      final querySnapshot = await devicesCollection.doc(deviceId).get();
      if (querySnapshot.exists) {
        final data = querySnapshot.data() as Map<String, dynamic>?;
        if (data != null) {
          final deviceModel = DeviceModel.fromJson(data);
          return deviceModel;
        } else {
          logger.d('data = null during getDevice');
        }
      }
    } catch (error) {
      logger.d('Error during getDevices : $error');
    }
    return null;
  }

  @override
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

  @override
  Future<List<String>> getUserDevices({required String userId}) async {
    try {
      final deviceList = await usersCollection.doc(userId).get();
      final data = deviceList.data() as Map<String, dynamic>?;
      if (data != null && data[devicesField] != null) {
        final devices = data[devicesField] as List<dynamic>;
        return devices.map((device) => device.toString()).toList();
      } else {
        logger.d('Empty list of devices for the user $userId ');
        return [];
      }
    } on Exception catch (e) {
      logger.d('Error getUserDevices: $e');
      return [];
    }
  }

  @override
  Future<void> deleteDevice({required String deviceId}) async {
    try {
      final deviceData = await devicesCollection.doc(deviceId).get();
      final userID = deviceData[userIdField];

      if (userID == null) {
        await devicesCollection.doc(deviceId).delete();
        logger.d('Device Deleted');
      } else {
        final userDevices = await getUserDevices(userId: userID.toString());
        userDevices.removeWhere((element) => element == deviceId);
        await usersCollection.doc(userID.toString()).update({
          'devices': userDevices,
        });
        logger.d("Device Removed from User's Device List");

        await devicesCollection.doc(deviceId).delete();
        logger.d('Device Deleted');
      }
    } on Exception catch (e) {
      logger.d('Error deleteDevice: $e');
    }
  }

  @override
  Future<void> deleteDeviceFromUser({required String deviceId}) async {
    try {
      final deviceData = await devicesCollection.doc(deviceId).get();
      final userID = deviceData[userIdField];

      final userDevices = await getUserDevices(userId: userID.toString());
      userDevices.removeWhere((element) => element == deviceId);
      await usersCollection.doc(userID.toString()).update({
        devicesField: userDevices,
      });
      await devicesCollection.doc(deviceId).update({
        userIdField: null,
        isActiveField: false,
        deviceNameField: null,
        createdAtByUserField: null,
      });
      logger.d("Device Removed from User's Device List");
    } on Exception catch (e) {
      logger.d('Error deleteDeviceFromUser: $e');
    }
  }

  @override
  Future<List<String>> getDeviceTypes() async {
    try {
      final types = await deviceTypesCollection.get();
      final typesList = <String>[];
      for (final doc in types.docs) {
        final fieldValue = doc.get(typeField) as String;
        typesList.add(fieldValue);
      }
      return typesList;
    } on Exception catch (e) {
      logger.d('Error getDeviceTypes: $e');
      return [];
    }
  }

  @override
  Stream<List<DataModel>> getDeviceData({
    required String deviceId,
    required String dateTime,
  }) {
    try {
      final query =
          devicesCollection.doc(deviceId).collection(dateTime).snapshots();
      return query.map(
        (querySnapshot) => querySnapshot.docs
            .map((doc) => DataModel.fromJson(doc.data()))
            .toList(),
      );
    } catch (error) {
      logger.d('Error during streamDeviceData : $error');
      return Stream.value([]);
    }
  }

  @override
  Future<void> setDeviceToUser({
    required String deviceId,
    required String userID,
    required String deviceName,
    required BuildContext context,
  }) async {
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
            deviceNameField: deviceName,
            isActiveField: true,
          });
        } else {
          if (!context.mounted) return;
          scaffoldMessenger(context, LocaleKeys.scaffoldMessages_wrongId);
        }
      } else {
        //TODO: If dont necessary then delete
        if (!context.mounted) return;
        scaffoldMessenger(context, LocaleKeys.scaffoldMessages_wrongId);
      }
    } catch (e) {
      logger.d('Error setDeviceToUser: $e');
    }
  }
}
