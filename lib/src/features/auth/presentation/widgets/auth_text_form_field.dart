import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/util/app_padding.dart';
import 'package:take_data_and_update_project/util/constants/app_colors.dart';
import 'package:take_data_and_update_project/util/extensions/build_context_extension.dart';

class AuthTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool? obscureText;
  const AuthTextFormField(
      {super.key,
      required this.hintText,
      required this.validator,
      required this.controller,
      required this.keyboardType,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    const int contentPadding = 15;

    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.horizontal.largePadding),
        child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obscureText ?? false,
          style: context.headlineSmall?.copyWith(color: AppColors.blackColor),
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.all(contentPadding.sp),
          ),
          validator: validator,
        ));
  }
}
