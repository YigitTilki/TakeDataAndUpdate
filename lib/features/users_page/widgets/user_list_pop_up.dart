import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/common/decorations.dart';
import 'package:take_data_and_update_project/features/common/scaffold_messengers.dart';
import 'package:take_data_and_update_project/features/users_page/state/state_management_user_list.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/util/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';

class UserListPopUp extends StatelessWidget {
  const UserListPopUp({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.id,
    required this.ref,
    super.key,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String id;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    const imageSize = 40;
    return AlertDialog(
      title: ListTile(
        leading: Assets.images.noProfilePhoto
            .image(width: imageSize.w, height: imageSize.h),
        title: Text('$firstName $lastName'),
        subtitle: Text(email),
      ),
      titlePadding: ProjectPadding.allSmall(),
      contentPadding: ProjectPadding.symHXXLarge(),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${LocaleKeys.usersPage_idUpper.tr()} : ',
                style: context.bodyMedium,
              ),
            ),
            AppSpacer.vertical.space5,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                id,
                style: context.titleMedium,
              ),
            ),
            AppSpacer.vertical.space5,
            Divider(
              color: context.fourthColor,
            ),
            AppSpacer.vertical.space5,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${LocaleKeys.usersPage_devices.tr()} :',
                style: context.bodyMedium,
              ),
            ),
            AppSpacer.vertical.space5,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '$id\n$id\n$id\n$id\n$id\n$id\n$id\n$id',
                style: context.titleMedium,
              ),
            ),
            AppSpacer.vertical.space10,
          ],
        ),
      ),
      actions: [
        AppSpacer.horizontal.space10,
        Center(
          child: ElevatedButton(
            onPressed: () async {
              final refresh = ref.refresh(userListProvider);
              ref.read(deleteUserProvider(id));
              // ignore: unnecessary_statements
              refresh;
              scaffoldMessenger(context, '$firstName $lastName Deleted');
              await context.router.pop();
            },
            child: Text(
              LocaleKeys.usersPage_deleteUser.tr(),
              style: context.titleLarge,
            ),
          ),
        ),
      ],
      shape: Decorations.popUpDecoration(context.fourthColor),
    );
  }
}
