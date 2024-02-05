import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/edit_user_page.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

mixin EditUserMixin on State<EditUserPage> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController rePasswordTextController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

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
    emailTextController.dispose();
    passwordTextController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    rePasswordTextController.dispose();
    super.dispose();
  }

  Future<void> elevatedButtonProcess() async {
    final userModel = UserModel(
      id: widget.userModel.id,
      email: emailTextController.text.toLowerCase(),
      devices: widget.userModel.devices,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      password: passwordTextController.text,
    );

    final isEmailExist = await AuthRepository()
        .isEmailExists(eMail: emailTextController.text.toLowerCase());

    if (!context.mounted) return;
    if (!EditUserPage.formKey.currentState!.validate()) {
      debugPrint('olmadı');
    } else if (isEmailExist &&
        emailTextController.text.toLowerCase() != widget.userModel.email) {
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
