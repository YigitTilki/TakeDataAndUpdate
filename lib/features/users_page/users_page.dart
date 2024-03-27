import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/auth/widgets/email_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/first_name_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/last_name_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/password_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/re_password_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/search_text_field.dart';
import 'package:take_data_and_update_project/features/users_page/mixin/add_user_mixin.dart';
import 'package:take_data_and_update_project/features/users_page/mixin/users_page_mixin.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/providers/user_providers.dart';
import 'package:take_data_and_update_project/product/providers/visibility_providers.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/util/show_dialog.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

part 'widgets/floating_action_button.dart';
part 'widgets/user_list_pop_up.dart';
part 'widgets/users_list.dart';
part 'widgets/users_page_divider.dart';

@RoutePage()
class UsersPage extends ConsumerStatefulWidget {
  const UsersPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UsersPageState();
}

class _UsersPageState extends ConsumerState<UsersPage> with UsersPageMixin {
  @override
  Widget build(BuildContext context) {
    final userListState = ref.watch(userListProvider);

    const iconSize = 20;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.secondaryColor,
      floatingActionButton: const UserListFloatingActionButton(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: ProjectPadding.allSmall(),
            child: Column(
              children: [
                const _Header(),
                AppSpacer.vertical.space20,

                ///Search Field
                SearchTextField(
                  searchTextController: searchController,
                  onChanged: (value) {
                    if (userListState is AsyncData<List<UserModel>>) {
                      ref.read(userListNotifierProvider.notifier).filterUsers(
                            value,
                            userListState.value.toList(),
                          );
                      ref.invalidate(userListProvider);
                    }
                  },
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
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      icon: Assets.icons.adminUsersIcon.image(),
      text: LocaleKeys.adminPage_users,
      needBackButton: true,
    );
  }
}
