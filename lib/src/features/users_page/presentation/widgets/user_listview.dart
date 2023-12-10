import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/core/constants/img_helper.dart';
import 'package:take_data_and_update_project/core/util/extensions/build_context_extension.dart';

class UserListView extends StatefulWidget {
  final TextEditingController searchController;
  final Future<List<Map<String, dynamic>>> userList;

  const UserListView(
      {super.key, required this.searchController, required this.userList});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  late Future<List<Map<String, dynamic>>> userList = widget.userList;

  @override
  Widget build(BuildContext context) {
    const int iconSize = 20;
    const int listTileHeight = 60;
    return FutureBuilder(
      future: userList,
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // Filtreleme işlemini gerçekleştir
          List<Map<String, dynamic>> filteredList = snapshot.data!
              .where((user) =>
                  user['FirstName']
                      .toLowerCase()
                      .contains(widget.searchController.text.toLowerCase()) ||
                  user['LastName']
                      .toLowerCase()
                      .contains(widget.searchController.text.toLowerCase()))
              .toList();

          return Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                String firstName = filteredList[index]['FirstName'];
                String lastName = filteredList[index]['LastName'];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.h),
                  child: Container(
                    height: listTileHeight.h,
                    decoration: ShapeDecoration(
                      color: context.fourthColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                        side: BorderSide(
                            color: context.primaryColor, width: 2.sp),
                      ),
                    ),
                    child: Center(
                      child: ListTile(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "$firstName $lastName",
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              });
                        },
                        leading: Image.asset(
                          ImageHelper.users,
                          width: iconSize.w,
                          height: iconSize.h,
                          color: context.primaryColor,
                        ),
                        title: Text("$firstName $lastName"),
                        subtitle: const Text("Email"),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
