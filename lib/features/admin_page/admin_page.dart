import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';
import 'package:take_data_and_update_project/product/widgets/containers/home_container.dart';
import 'package:take_data_and_update_project/product/widgets/pop_scope.dart';
import 'package:take_data_and_update_project/product/widgets/text/large_text.dart';

part 'widgets/users_container.dart';

@RoutePage()
class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyPopScope(
      child: Scaffold(
        backgroundColor: context.secondaryColor,
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: 340.w,
              height: 600.h,
              child: Column(
                children: [
                  const _Header(),
                  AppSpacer.vertical.space20,
                  const _UsersContainer(),
                ],
              ),
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
      needBackButton: false,
      icon: Assets.icons.adminIcon.image(
        height: 20.h,
        color: context.fourthColor,
      ),
      text: LocaleKeys.adminPage_admin,
    );
  }
}
