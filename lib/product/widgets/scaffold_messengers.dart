import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> scaffoldMessenger(
  BuildContext context,
  String text,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    //TODO: Refactor it
    SnackBar(
      content: Text(
        text,
        style: context.headlineSmall,
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: context.fourthColor, width: 5.sp),
      ),
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
      width: 250.w,
    ),
  );
}
