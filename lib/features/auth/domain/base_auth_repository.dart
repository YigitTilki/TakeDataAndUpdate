import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/auth/domain/user_model.dart';

abstract class BaseAuthRepository {
  Future<void> signInUser(
      {required String emailController,
      required String passwordController,
      required BuildContext context});
  Future<void> singUpUser({
    required UserModel userModel,
    required BuildContext context,
  });
  Future<List<Map<String, dynamic>>> getUsers();
  Future<void> loginAdmin(
      {required BuildContext context,
      required String emailController,
      required String passwordController});
  Future<void> signUpAdmin(
      {required BuildContext context,
      required String emailController,
      required String passwordController,
      required String displayName});
  Future<bool> isEmailExists({required String eMail});
}
