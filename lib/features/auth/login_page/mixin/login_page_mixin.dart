import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/auth/login_page/login_page.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/providers/splash_provider.dart';
import 'package:take_data_and_update_project/product/providers/visibility_providers.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/util/wifi_connector.dart';

mixin LoginPageMixin on ConsumerState<LoginPage> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    wifiConnector(context, ref);
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  Future<void> elevatedButtonProcess() async {
    final user = UserModel(
      email: emailTextController.text.toLowerCase(),
      password: passwordTextController.text,
    );
    final isAdmin = await AuthRepository().isAdmin(password: user.password!);
    if (!context.mounted) return;

    if (isAdmin) {
      await context.router.push(const AdminRoute());
    } else if (!formKeyLogin.currentState!.validate()) {
      debugPrint('Olmadı');
    } else {
      await AuthRepository().signInUser(
        userModel: user,
        context: context,
      );
    }
  }

  Future<void> checkBoxProcess(bool? value) async {
    final userModel = await AuthRepository()
        .getUser(email: emailTextController.text.toLowerCase());
    ref.read(checkBoxProvider.notifier).state = value!;
    await ref
        .read(splashProvider.notifier)
        .saveRememberMe(value: value, userModel: userModel);
  }
}
