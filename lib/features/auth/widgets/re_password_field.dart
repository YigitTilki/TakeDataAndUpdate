import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/validators/validators.dart';
import 'package:take_data_and_update_project/product/widgets/password_obscure_icon.dart';

class RePasswordField extends StatelessWidget {
  const RePasswordField({
    required this.rePasswordTextController,
    required this.onPressedIcon,
    required this.isPasswordVisible,
    required this.passwordTextController,
    super.key,
  });
  final TextEditingController rePasswordTextController;
  final TextEditingController passwordTextController;

  final VoidCallback onPressedIcon;
  final bool isPasswordVisible;

  @override
  Widget build(BuildContext context) {
    return AuthTextFormField(
      hintText: LocaleKeys.registerPage_rePassword,
      keyboardType: TextInputType.visiblePassword,
      obscureText: isPasswordVisible,
      suffixIcon: passwordObscureIcon(
        context: context,
        isPasswordVisible: isPasswordVisible,
        onPressed: onPressedIcon,
      ),
      controller: rePasswordTextController,
      validator: (value) => Validators().rePassword(
        value: value,
        passwordController: passwordTextController.text,
      ),
    );
  }
}
