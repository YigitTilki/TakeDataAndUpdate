import 'dart:convert';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:take_data_and_update_project/features/forgot_password/pages/forgot_password_page.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

mixin ForgotPasswordMixin on State<ForgotPasswordPage> {
  final TextEditingController emailTextController = TextEditingController();
  GlobalKey<FormState> formKeyForgotPassword = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    generateCode();
  }

  @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
  }

  Future<void> sendEmail({
    required String name,
    required String replyMail,
    required String subject,
    required String message,
    required String toEmail,
  }) async {
    const serviceId = 'service_l7yp5c8';
    const templateId = 'template_obeszmf';
    const userId = 'qFcBLaFNEIJWBBJU1';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    await http.post(
      url,
      headers: {
        'origin': 'http://localhost', // TODO: Change to your domain
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': replyMail,
          'to_email': toEmail,
          'user_subject': subject,
          'user_message': message,
        },
      }),
    );
  }

  int generateCode() {
    final random = Random();
    final randomNumber = random.nextInt(90000) + 10000;
    return randomNumber;
  }

  Future<void> elevatedButtonProcess() async {
    final code = generateCode();
    final emailExists = await AuthRepository()
        .isEmailExists(eMail: emailTextController.text.toLowerCase());
    final userModel = await AuthRepository()
        .getUser(email: emailTextController.text.toLowerCase());
    if (!formKeyForgotPassword.currentState!.validate()) {
      debugPrint('Olmadı');
    } else if (!emailExists) {
      scaffoldMessenger(context, 'Böyle Bir Email Yok');
    } else {
      scaffoldMessenger(context, 'Email Gönderildi');
      await sendEmail(
        name: userModel!.firstName.toString(),
        replyMail: 'yigittilkiw@gmail.com',
        subject: 'VTGRS için Şifre Değişikliği',
        message: 'Şifre sıfırlamak için kod: $code',
        toEmail: emailTextController.text.toLowerCase(),
      );
      await context.router.push(
        EnterCodeRoute(
          code: code,
          email: emailTextController.text.toLowerCase(),
        ),
      );
    }
  }
}
