import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/edit_user_page.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

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

  Future<void> elevatedButtonProcess() async {
    final userModel = UserModel(
      id: widget.userModel.id,
      email: emailTextController.text,
      devices: widget.userModel.devices,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      password: passwordTextController.text,
    );

    final isEmailExist =
        await AuthRepository().isEmailExists(eMail: emailTextController.text);

    if (!context.mounted) return;
    if (!EditUserPage.formKey.currentState!.validate()) {
      debugPrint('olmadı');
    } else if (isEmailExist &&
        emailTextController.text != widget.userModel.email) {
      scaffoldMessenger(
        context,
        LocaleKeys.scaffoldMessages_emailCantBeUsed,
      );
    } else {
      scaffoldMessenger(context, LocaleKeys.settingsPage_userUpdated);
      await AuthRepository().updateUser(
        userModel: userModel,
        context: context,
      );
      if (!context.mounted) return;
      await context.router.replace(const LoginRoute());
    }
  }
}
