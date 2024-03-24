import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/auth/register_page/register_page.dart';
import 'package:take_data_and_update_project/product/enums/env_enums.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/service/email_service.dart';
import 'package:take_data_and_update_project/product/util/wifi_connector.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';
import 'package:uuid/uuid.dart';

mixin RegisterPageMixin on ConsumerState<RegisterPage> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController rePasswordTextController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    wifiConnector(context, ref);
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
    final code = EmailService().generateCode();
    final userModel = UserModel(
      id: const Uuid().v4(),
      email: emailTextController.text.toLowerCase(),
      password: passwordTextController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
    );
    final emailExists = await AuthRepository()
        .isEmailExists(eMail: emailTextController.text.toLowerCase());
    if (!context.mounted) return;
    if (!formKeyRegister.currentState!.validate()) {
      debugPrint('Olmadı');
    } else if (emailExists) {
      scaffoldMessenger(context, LocaleKeys.scaffoldMessages_emailExist);
    } else {
      await EmailService().sendEmail(
        name: userModel.firstName.toString(),
        replyMail: EnvEnums.replyMail.dotEnv,
        subject: 'E-Mail verification for VTGRS',
        message: 'Code for verify: $code',
        toEmail: emailTextController.text.toLowerCase(),
      );
      if (!context.mounted) return;
      scaffoldMessenger(context, LocaleKeys.forgotPassword_emailSend);
      await context.router
          .push(VerifyEmailRoute(code: code, userModel: userModel));
    }
  }
}
