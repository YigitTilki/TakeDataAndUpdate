import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/validators/validators.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    required this.emailTextController,
    required this.isLogin,
    super.key,
  });

  final TextEditingController emailTextController;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return AuthTextFormField(
      hintText: LocaleKeys.commons_eMail,
      keyboardType: TextInputType.emailAddress,
      controller: emailTextController,
      validator: (value) {
        if (isLogin) {
          return Validators().loginEMail(
            value: value,
            emailController: emailTextController.text,
          );
        } else {
          return Validators()
              .eMail(value: value, emailController: emailTextController.text);
        }
      },
    );
  }
}
