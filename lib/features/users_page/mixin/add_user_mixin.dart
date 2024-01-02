import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/users_page/users_page.dart';

mixin AddUserMixin on State<UserListFloatingActionButton> {
  final formKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final rePasswordTextController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    rePasswordTextController.dispose();
    super.dispose();
  }

  void clearController() {
    emailTextController.clear();
    passwordTextController.clear();
    firstNameController.clear();
    lastNameController.clear();
    rePasswordTextController.clear();
  }
}
