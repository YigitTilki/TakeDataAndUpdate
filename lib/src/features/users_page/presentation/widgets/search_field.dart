import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/core/constants/app_string.dart';
import 'package:take_data_and_update_project/core/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/src/features/users_page/implementation/users_page_firebase_connection.dart';

class SearchField extends StatefulWidget {
  final TextEditingController searchController;
  final Future<List<Map<String, dynamic>>> userList;
  const SearchField(
      {super.key, required this.searchController, required this.userList});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late Future<List<Map<String, dynamic>>> userList = widget.userList;

  @override
  Widget build(BuildContext context) {
    const int iconSize = 25;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.sp),
      child: TextField(
        controller: widget.searchController,
        style: context.headlineMedium,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 15.0.w, right: 10.w),
            child: Icon(
              Icons.search,
              size: iconSize.sp,
            ),
          ),
          hintText: AppString.search,
          hintStyle: context.headlineMedium,
        ),
        onChanged: (value) {
          setState(() {
            userList = getUsers().then((users) {
              return users
                  .where((user) =>
                      user['FirstName']
                          .toLowerCase()
                          .contains(value.toLowerCase()) ||
                      user['LastName']
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                  .toList();
            });
          });
        },
      ),
    );
  }
}
