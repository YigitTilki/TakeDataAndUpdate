import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';

abstract class BaseAuthRepository {
  Future<void> signInUser({
    required UserModel userModel,
    required BuildContext context,
  });
  Future<void> singUpUser({
    required UserModel userModel,
    required BuildContext context,
  });
  Future<List<UserModel>> getUsers();
  Future<void> loginAdmin({
    required BuildContext context,
    required UserModel userModel,
  });
  Future<void> signUpAdmin({
    required BuildContext context,
    required UserModel userModel,
  });
  Future<void> signUpAuthUser({
    required BuildContext context,
    required UserModel userModel,
  });
  Future<void> deleteUser({
    required String id,
  });
  Future<bool> isEmailExists({required String eMail});
}
