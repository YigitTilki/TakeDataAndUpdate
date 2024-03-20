import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/validators/validators.dart';
import 'package:take_data_and_update_project/product/widgets/password_obscure_icon.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    required this.passwordTextController,
    required this.onPressed,
    required this.isPasswordVisible,
    required this.isLogin,
    super.key,
  });
  final TextEditingController passwordTextController;
  final VoidCallback onPressed;
  final bool isPasswordVisible;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return AuthTextFormField(
      hintText: LocaleKeys.commons_password,
      keyboardType: TextInputType.visiblePassword,
      obscureText: isPasswordVisible,
      suffixIcon: passwordObscureIcon(
        context: context,
        isPasswordVisible: isPasswordVisible,
        onPressed: onPressed,
      ),
      controller: passwordTextController,
      validator: (value) {
        if (isLogin) {
          return Validators().loginPassword(
            value: value,
          );
        } else {
          return Validators().password(value: value);
        }
      },
    );
  }
}
