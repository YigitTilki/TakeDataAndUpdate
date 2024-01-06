import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/auth/presentation/pages/set_own_password_page.dart/set_own_password_page.dart';

mixin SetOwnPasswordMixin on State<SetOwnPasswordPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _rePasswordTextController =
      TextEditingController();

  TextEditingController get passwordTextController => _passwordTextController;
  TextEditingController get rePasswordTextController =>
      _rePasswordTextController;

  @override
  void dispose() {
    _passwordTextController.dispose();
    _rePasswordTextController.dispose();
    super.dispose();
  }
}
