import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/validators/validators.dart';

class LastNameField extends StatelessWidget {
  const LastNameField({
    required this.lastNameController,
    super.key,
  });

  final TextEditingController lastNameController;

  @override
  Widget build(BuildContext context) {
    return AuthTextFormField(
      controller: lastNameController,
      keyboardType: TextInputType.name,
      hintText: LocaleKeys.registerPage_lastName,
      validator: (value) => Validators().lastName(value: value),
    );
  }
}
