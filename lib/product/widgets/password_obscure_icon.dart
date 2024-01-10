import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';

IconButton passwordObscureIcon({
  required BuildContext context,
  required bool isPasswordVisible,
  required VoidCallback onPressed,
}) {
  return IconButton(
    icon: Icon(
      isPasswordVisible ? Icons.visibility_off : Icons.visibility,
      color: context.primaryColor,
    ),
    onPressed: onPressed,
  );
}
