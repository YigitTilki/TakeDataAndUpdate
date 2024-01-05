import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';

part 'widgets/profile_image.dart';
part 'widgets/users_container.dart';

@RoutePage()
class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 340.w,
            height: 600.h,
            decoration: Decorations.containerDecoration(context.secondaryColor),
            child: Column(
              children: [
                AppSpacer.vertical.space20,
                const _ProfileImage(),
                AppSpacer.vertical.space5,
                Text(
                  LocaleKeys.adminPage_admin,
                  style: context.displaySmall,
                ).tr(),
                AppSpacer.vertical.space15,
                const _UsersContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
