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
  Future<void> updateUser({
    required UserModel userModel,
    required BuildContext context,
  });
  Future<List<UserModel>> getUsers();
  Future<UserModel?> getUser({required String email});
  Future<UserModel?> getUserWithId({required String id});

  Future<void> deleteUser({
    required String id,
  });
  Future<bool> isEmailExists({required String eMail});

  Future<bool> isAdmin({required String password});
}
