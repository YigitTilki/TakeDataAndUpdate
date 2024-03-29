import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    const dividerIndent = 6;
    return Divider(
      endIndent: dividerIndent.w,
      indent: dividerIndent.w,
      thickness: 3.h,
      color: context.primaryColor,
    );
  }
}
