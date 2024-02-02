import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/auth/login_page/login_page.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';

mixin LoginPageMixin on ConsumerState<LoginPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get passwordTextController => _passwordTextController;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  Future<void> elevatedButtonProcess() async {
    final user = UserModel(
      email: emailTextController.text,
      password: passwordTextController.text,
    );
    final isAdmin = await AuthRepository().isAdmin(password: user.password!);
    if (!context.mounted) return;

    if (isAdmin) {
      await context.router.push(const AdminRoute());
    } else if (!LoginPage.formKeyLogin.currentState!.validate()) {
      debugPrint('Olmadı');
    } else {
      await AuthRepository().signInUser(
        userModel: user,
        context: context,
      );
    }
  }
}
