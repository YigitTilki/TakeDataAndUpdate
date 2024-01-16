import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/auth/register_page/register_page.dart';

mixin RegisterPageMixin on ConsumerState<RegisterPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _rePasswordTextController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get passwordTextController => _passwordTextController;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get rePasswordTextController =>
      _rePasswordTextController;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _rePasswordTextController.dispose();
    super.dispose();
  }
}
