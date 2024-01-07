import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:take_data_and_update_project/product/base/base_auth_repository.dart';
import 'package:take_data_and_update_project/product/enums/firebase_enums.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

class AuthRepository extends BaseAuthRepository {
  final _usersCollection = FirebaseCollections.users.reference;
  final _adminCollection = FirebaseCollections.admin.reference;
  final _emailField = FirebaseFields.email.field;
  final _passwordField = FirebaseFields.password.field;
  final _firstNameField = FirebaseFields.firstName.field;
  final _lastNameField = FirebaseFields.lastName.field;
  final _idField = FirebaseFields.id.field;
  final _devicesField = FirebaseFields.devices.field;

  Logger logger = Logger();

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final querySnapshot = await _usersCollection.get();
      final userList = <UserModel>[];

      for (final doc in querySnapshot.docs) {
        final user = UserModel.fromJson(doc.data()! as Map<String, dynamic>);
        userList.add(user);
      }

      return userList;
    } catch (error) {
      logger.d('Error during getUsers : $error');
      return [];
    }
  }

  @override
  Future<void> signInUser({
    required UserModel userModel,
    required BuildContext context,
  }) async {
    try {
      final result = await _usersCollection
          .where(_emailField, isEqualTo: userModel.email)
          .where(_passwordField, isEqualTo: userModel.password)
          .get();

      if (!context.mounted) return;

      if (result.docs.isNotEmpty) {
        final firstName = result.docs.first[_firstNameField].toString();
        final lastName = result.docs.first[_lastNameField].toString();
        final id = result.docs.first[_idField].toString();
        final devices = result.docs.first[_devicesField].toString();

        userModel = userModel.copyWith(
          firstName: firstName,
          lastName: lastName,
          id: id,
          devices: devices,
        );

        await context.router.replace(HomeRoute(userModel: userModel));
      } else {
        scaffoldMessenger(context, 'E-Mail or Password Error');
      }
    } catch (error) {
      logger.d('Error during sign-in: $error');
    }
  }

  @override
  Future<void> singUpUser({
    required UserModel userModel,
    required BuildContext context,
  }) async {
    try {
      final userMap = userModel.toMap();
      final passwordFetch = await _usersCollection
          .where(_passwordField, isEqualTo: userModel.password)
          .get();

      if (passwordFetch.docs.isNotEmpty) {
        await _usersCollection.doc(userModel.id).set(userMap);

        if (!context.mounted) return;
        logger.d('User Added');

        await context.router.replace(HomeRoute(userModel: userModel));
      } else {
        if (!context.mounted) return;
        scaffoldMessenger(context, "There isn't fetch passwords");
      }
    } catch (e) {
      logger.d('User cant be added: $e');
    }
  }

  @override
  Future<bool> isEmailExists({required String eMail}) async {
    final query =
        await _usersCollection.where(_emailField, isEqualTo: eMail).get();

    if (query.docs.isNotEmpty) return false;
    return true;
  }

  @override
  Future<void> deleteUser({required String id}) {
    return _usersCollection
        .doc(id)
        .delete()
        .then((value) => logger.d('User Deleted'))
        // ignore: inference_failure_on_untyped_parameter
        .catchError((error) => logger.d('Failed to delete user: $error'));
  }

  @override
  Future<bool> isAdmin({required String password}) async {
    final value =
        await _adminCollection.where(_passwordField, isEqualTo: password).get();
    if (value.docs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> updateUser({
    required UserModel userModel,
    required BuildContext context,
  }) async {
    try {
      await _usersCollection.doc(userModel.id).update(userModel.toMap());
      logger.d('User Updated');
    } catch (e) {
      logger.d('Error : $e');
    }
  }
}
