import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/forgot_password/pages/reset_password_page.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';

mixin ResetPasswordMixin on ConsumerState<ResetPasswordPage> {
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController rePasswordTextController =
      TextEditingController();
  GlobalKey<FormState> formKeyResetPassword = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    passwordTextController.dispose();
    rePasswordTextController.dispose();
  }

  Future<void> elevatedButtonProcess() async {
    final userModel = await AuthRepository().getUser(email: widget.email);
    if (!formKeyResetPassword.currentState!.validate()) {
      debugPrint('Olmadı');
    } else {
      await AuthRepository().updateUser(
        userModel: userModel!.copyWith(password: passwordTextController.text),
        context: context,
      );
      await context.router.push(const LoginRoute());
    }
  }
}
