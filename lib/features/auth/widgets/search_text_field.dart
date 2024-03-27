import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    required this.searchTextController,
    required this.onChanged,
    super.key,
  });
  final TextEditingController searchTextController;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.symHXXSmall(),
      child: TextField(
        controller: searchTextController,
        style: context.headlineMedium,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: ProjectPadding.symHMedium(),
            child: Icon(
              Icons.search,
              size: 20.sp,
            ),
          ),
          hintText: LocaleKeys.adminPage_usersPage_search.tr(),
          hintStyle: context.headlineMedium,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
