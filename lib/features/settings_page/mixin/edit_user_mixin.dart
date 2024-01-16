import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/edit_user_page.dart';

mixin EditUserMixin on State<EditUserPage> {
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
  void initState() {
    super.initState();
    firstNameController.text = widget.userModel.firstName.toString();
    lastNameController.text = widget.userModel.lastName.toString();
    passwordTextController.text = widget.userModel.password.toString();
    emailTextController.text = widget.userModel.email.toString();
  }

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
