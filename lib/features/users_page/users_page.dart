import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/auth/data/auth_repository.dart';
import 'package:take_data_and_update_project/features/users_page/mixin/users_page_mixin.dart';
import 'package:take_data_and_update_project/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/util/constants/app_spacer.dart';
import 'package:take_data_and_update_project/util/constants/project_padding.dart';
import 'package:take_data_and_update_project/util/extensions/build_context_extension.dart';

part 'widgets/floating_action_button.dart';
part 'widgets/users_list.dart';
part 'widgets/users_page_divider.dart';

@RoutePage()
class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> with UsersPageMixin {
  @override
  Widget build(BuildContext context) {
    const int iconSize = 20;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.secondaryColor,
      floatingActionButton: const _FloatingActionButton(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: ProjectPadding.allSmall(),
            child: Column(
              children: [
                ///Search Field
                Padding(
                  padding: ProjectPadding.symHXXSmall(),
                  child: _searchTextField(context, iconSize),
                ),
                AppSpacer.vertical.space5,

                ///Divider
                const _UsersPageDivider(),
                AppSpacer.vertical.space5,

                ///ListView
                _UsersList(
                  userList: userList,
                  searchController: searchController,
                  iconSize: iconSize,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField _searchTextField(BuildContext context, int iconSize) {
    return TextField(
      controller: searchController,
      style: context.headlineMedium,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 15.0.w, right: 10.w),
          child: Icon(
            Icons.search,
            size: iconSize.sp,
          ),
        ),
        hintText: LocaleKeys.adminPage_usersPage_search.tr(),
        hintStyle: context.headlineMedium,
      ),
      onChanged: (value) {
        setState(() {
          userListSetter = AuthRepository().getUsers().then((users) {
            return users
                .where((user) =>
                    user['firstName']
                        .toLowerCase()
                        .contains(value.toLowerCase()) ||
                    user['lastName']
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                .toList();
          });
        });
      },
    );
  }
}
