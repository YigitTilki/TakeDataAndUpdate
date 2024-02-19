import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:take_data_and_update_project/product/base/base_auth_repository.dart';
import 'package:take_data_and_update_project/product/enums/firebase_enums.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

class AuthRepository extends BaseAuthRepository {
  Logger logger = Logger();

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final querySnapshot = await usersCollection.get();
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
      final result = await usersCollection
          .where(emailField, isEqualTo: userModel.email)
          .where(passwordField, isEqualTo: userModel.password)
          .get();

      if (result.docs.isNotEmpty) {
        userModel = userModel.copyWith(
          firstName: result.docs.first[firstNameField].toString(),
          lastName: result.docs.first[lastNameField].toString(),
          id: result.docs.first[idField].toString(),
          devices: result.docs.first[devicesField].toString(),
        );

        await context.router.replace(HomeRoute(userModel: userModel));
      } else {
        scaffoldMessenger(
          context,
          LocaleKeys.scaffoldMessages_wrongEmailAndPassword,
        );
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
      final passwordFetch = await passwordsCollection
          .where(passwordField, isEqualTo: userModel.password)
          .get();

      if (passwordFetch.docs.isNotEmpty) {
        await usersCollection.doc(userModel.id).set(userMap);
        logger.d('User Added');
      } else {
        scaffoldMessenger(
          context,
          LocaleKeys.scaffoldMessages_wrongPassword,
        );
      }
    } catch (e) {
      logger.d('User cant be added: $e');
    }
  }

  @override
  Future<bool> isEmailExists({required String eMail}) async {
    final query =
        await usersCollection.where(emailField, isEqualTo: eMail).get();

    if (query.docs.isNotEmpty) return true;
    return false;
  }

  @override
  Future<void> deleteUser({required String id}) {
    return usersCollection
        .doc(id)
        .delete()
        .then((value) => logger.d('User Deleted'))
        .catchError(
          (value) => logger.d('User Cant be Deleted'),
        );
  }

  @override
  Future<bool> isAdmin({required String password}) async {
    final value =
        await adminCollection.where(passwordField, isEqualTo: password).get();
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
      await usersCollection.doc(userModel.id).update(userModel.toMap());
      logger.d('User Updated');
    } catch (e) {
      logger.d('Error : $e');
    }
  }
}
