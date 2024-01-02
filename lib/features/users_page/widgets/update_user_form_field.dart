import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/util/constants/app_colors.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';

class UpdateUserPopUpFormField extends StatelessWidget {
  const UpdateUserPopUpFormField({
    required this.validator,
    required this.controller,
    required this.keyboardType,
    required this.labelText,
    required this.initialValue,
    super.key,
  });

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType keyboardType;

  final String labelText;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      initialValue: initialValue,
      style: context.headlineSmall?.copyWith(color: AppColors.blackColor),
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.all(15.sp),
      ),
      validator: validator,
    );
  }
}
