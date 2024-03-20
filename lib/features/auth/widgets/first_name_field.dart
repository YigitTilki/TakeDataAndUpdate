import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/validators/validators.dart';

class FirstNameField extends StatelessWidget {
  const FirstNameField({
    required this.firstNameController,
    super.key,
  });

  final TextEditingController firstNameController;

  @override
  Widget build(BuildContext context) {
    return AuthTextFormField(
      controller: firstNameController,
      keyboardType: TextInputType.name,
      hintText: LocaleKeys.registerPage_firstName,
      validator: (value) => Validators().firstName(value: value),
    );
  }
}
