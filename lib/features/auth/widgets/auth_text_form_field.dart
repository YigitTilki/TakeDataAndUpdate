import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';

final class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    required this.hintText,
    required this.validator,
    required this.controller,
    required this.keyboardType,
    super.key,
    this.obscureText,
    this.suffixIcon,
  });
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool? obscureText;
  final IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.symHLarge(),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText ?? false,
        style: context.headlineSmall?.copyWith(
          color: context.textFieldTextColor,
          decorationColor: context.fourthColor,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: Padding(
            padding: ProjectPadding.symHMedium(),
            child: suffixIcon ?? const SizedBox.shrink(),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
