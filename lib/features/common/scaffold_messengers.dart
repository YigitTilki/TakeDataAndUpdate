import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/util/extensions/build_context_extension.dart';

scaffoldMessenger(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: context.headlineSmall,
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.fourthColor, width: 5.sp),
      ),
    ),
  );
}
