import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/core/constants/app_string.dart';
import 'package:take_data_and_update_project/core/constants/img_helper.dart';
import 'package:take_data_and_update_project/core/util/app_spacer.dart';
import 'package:take_data_and_update_project/core/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/src/features/users_page/implementation/users_page_firebase_connection.dart';
import 'package:take_data_and_update_project/src/features/users_page/presentation/widgets/users_page_divider.dart';

@RoutePage()
class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late Future<List<Map<String, dynamic>>> _userList;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _userList = getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const int iconSize = 20;
    const int listTileHeight = 60;
    const int boxWidth = 340;
    const int boxHeight = 600;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.secondaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
              width: boxWidth.w,
              height: boxHeight.h,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0.sp),
                    child: TextField(
                      controller: _searchController,
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
                          _userList = getUsers().then((users) {
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
                  ),
                  AppSpacer.vertical.space5,
                  const UsersPageDivider(),
                  AppSpacer.vertical.space5,
                  FutureBuilder(
                    future: _userList,
                    builder: (context,
                        AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        List<Map<String, dynamic>> filteredList = snapshot.data!
                            .where((user) =>
                                user['FirstName'].toLowerCase().contains(
                                    _searchController.text.toLowerCase()) ||
                                user['LastName'].toLowerCase().contains(
                                    _searchController.text.toLowerCase()))
                            .toList();

                        return Expanded(
                          child: ListView.builder(
                            itemCount: filteredList.length,
                            itemBuilder: (BuildContext context, int index) {
                              String firstName =
                                  filteredList[index]['FirstName'];
                              String lastName = filteredList[index]['LastName'];
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 4.h),
                                child: Container(
                                  height: listTileHeight.h,
                                  decoration: ShapeDecoration(
                                    color: context.fourthColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.sp),
                                      side: BorderSide(
                                          color: context.primaryColor,
                                          width: 2.sp),
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
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
