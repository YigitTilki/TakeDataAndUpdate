import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/core/util/extensions/build_context_extension.dart';

class UsersPageDivider extends StatelessWidget {
  const UsersPageDivider({super.key});

  @override
  Widget build(BuildContext context) {
    const int dividerIndent = 6;
    return Divider(
      endIndent: dividerIndent.w,
      indent: dividerIndent.w,
      thickness: 3.h,
      color: context.primaryColor,
    );
  }
}
