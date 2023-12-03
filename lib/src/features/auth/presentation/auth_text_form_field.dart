import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/core/util/app_padding.dart';
import 'package:take_data_and_update_project/core/util/extensions/build_context_extension.dart';

class AuthTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  const AuthTextFormField(
      {super.key, required this.hintText, required this.validator});

  @override
  Widget build(BuildContext context) {
    const int contentPadding = 15;

    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.horizontal.largePadding),
        child: TextFormField(
          style: context.labelLarge,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.all(contentPadding.sp),
          ),
          validator: validator,
        ));
  }
}
