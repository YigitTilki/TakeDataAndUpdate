import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/users_page/state/state_management_user_list.dart';
import 'package:take_data_and_update_project/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/util/constants/app_spacer.dart';
import 'package:take_data_and_update_project/util/constants/project_padding.dart';
import 'package:take_data_and_update_project/util/extensions/build_context_extension.dart';

class userListPopUp extends StatelessWidget {
  const userListPopUp({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.id,
    required this.ref,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String id;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    const int imageSize = 40;
    return AlertDialog(
      title: ListTile(
        leading: Assets.images.noProfilePhoto
            .image(width: imageSize.w, height: imageSize.h),
        title: Text("$firstName $lastName"),
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
                "ID : ",
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
                "Devices :",
                style: context.bodyMedium,
              ),
            ),
            AppSpacer.vertical.space5,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "$id\n$id\n$id\n$id\n$id\n$id\n$id\n$id",
                style: context.titleMedium,
              ),
            ),
            AppSpacer.vertical.space10,
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                context.router.pop();
              },
              child: Text(
                LocaleKeys.usersPage_updateUser.tr(),
                style: context.titleLarge,
              ),
            ),
            AppSpacer.horizontal.space20,
            ElevatedButton(
              onPressed: () async {
                var refresh = ref.refresh(userListProvider);
                await ref.read(deleteUserProvider(id));
                refresh;
                context.router.pop();
              },
              child: Text(
                LocaleKeys.usersPage_deleteUser.tr(),
                style: context.titleLarge,
              ),
            ),
          ],
        ),
      ],
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 8.sp,
          color: context.fourthColor,
        ),
        borderRadius: BorderRadius.circular(15.sp),
      ),
    );
  }
}
