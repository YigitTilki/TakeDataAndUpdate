import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/forgot_password/pages/forgot_password_page.dart';
import 'package:take_data_and_update_project/product/enums/env_enums.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/service/email_service.dart';
import 'package:take_data_and_update_project/product/util/wifi_connector.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

mixin ForgotPasswordMixin on ConsumerState<ForgotPasswordPage> {
  final TextEditingController emailTextController = TextEditingController();
  GlobalKey<FormState> formKeyForgotPassword = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    wifiConnector(context, ref);
    EmailService().generateCode();
  }

  @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
  }

  Future<void> elevatedButtonProcess() async {
    final code = EmailService().generateCode();
    final emailExists = await AuthRepository()
        .isEmailExists(eMail: emailTextController.text.toLowerCase());
    final userModel = await AuthRepository()
        .getUser(email: emailTextController.text.toLowerCase());
    if (!formKeyForgotPassword.currentState!.validate()) {
      debugPrint('Olmadı');
    } else if (!emailExists) {
      if (!context.mounted) return;
      scaffoldMessenger(context, LocaleKeys.validatorErrors_invalidEmail);
    } else {
      await EmailService().sendEmail(
        name: userModel!.firstName.toString(),
        replyMail: EnvEnums.replyMail.dotEnv,
        subject: 'Reset password VTGRS',
        message: 'Code for the reset password: $code',
        toEmail: emailTextController.text.toLowerCase(),
      );
      if (!context.mounted) return;
      scaffoldMessenger(context, LocaleKeys.forgotPassword_emailSend);
      await context.router.push(
        EnterCodeRoute(
          code: code,
          email: emailTextController.text.toLowerCase(),
        ),
      );
    }
  }
}
