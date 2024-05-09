import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/product/base/base_auth_repository.dart';
import 'package:take_data_and_update_project/product/enums/firebase_enums.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/util/version_manager.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

class AuthRepository extends BaseAuthRepository {
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
    } catch (e) {
      logger.d('Error during getUsers : $e');
      return [];
    }
  }

  @override
  Future<UserModel?> getUser({required String email}) async {
    try {
      final user =
          await usersCollection.where(emailField, isEqualTo: email).get();
      if (user.docs.isNotEmpty) {
        //TODO: control
        final userModel = UserModel.fromJson(user as Map<String, dynamic>);
        return userModel;
      }
    } catch (e) {
      logger.d('Error during getUser : $e');
    }
    return null;
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
        final userData = result.docs.first.data()! as Map<String, dynamic>;
        userModel = UserModel.fromJson(userData);
        if (!context.mounted) return;

        await context.router.push(HomeRoute(userModel: userModel));
        logger.d('Signed In');
      } else {
        if (!context.mounted) return;

        scaffoldMessenger(
          context,
          LocaleKeys.scaffoldMessages_wrongEmailAndPassword,
        );
      }
    } catch (e) {
      logger.d('Error during sign-in: $e');
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
        if (!context.mounted) return;
        await context.router.replace(HomeRoute(userModel: userModel));
        logger.d('Signed Up');
      } else {
        if (!context.mounted) return;
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
    try {
      final query =
          await usersCollection.where(emailField, isEqualTo: eMail).get();

      if (query.docs.isNotEmpty) return true;
      return false;
    } on Exception catch (e) {
      logger.d('Error during isEmailExist: $e');
      return true;
    }
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
    try {
      final value =
          await adminCollection.where(passwordField, isEqualTo: password).get();
      if (value.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      logger.d('Errors  in isAdmin : $e');
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
      logger.d('Error during updateUser : $e');
    }
  }

  @override
  Future<UserModel?> getUserWithId({required String id}) async {
    try {
      final user = await usersCollection.where(idField, isEqualTo: id).get();
      if (user.docs.isNotEmpty) {
        //TODO: control
        final userModel = UserModel.fromJson(user as Map<String, dynamic>);
        return userModel;
      }
    } catch (e) {
      logger.d('Error during getUserWithId:  $e');
    }
    return null;
  }
}
