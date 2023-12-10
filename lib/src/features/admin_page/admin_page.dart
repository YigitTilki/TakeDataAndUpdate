import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/core/constants/app_string.dart';
import 'package:take_data_and_update_project/core/constants/img_helper.dart';
import 'package:take_data_and_update_project/core/route/app_router.dart';
import 'package:take_data_and_update_project/core/util/app_spacer.dart';
import 'package:take_data_and_update_project/core/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/src/features/common/main_container_decoration.dart';

@RoutePage()
class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    const int mainContainerWidth = 340;
    const int mainContainerHeight = 600;
    const int profileIconSize = 100;
    const int iconSize = 90;
    const int gestureContainerWidth = 290;
    const int gestureContainerHeight = 130;
    const int textBox = 160;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: mainContainerWidth.w,
            height: mainContainerHeight.h,
            decoration: containerDecoration(context.secondaryColor),
            child: Column(
              children: [
                AppSpacer.vertical.space20,
                SizedBox(
                  height: profileIconSize.h,
                  width: profileIconSize.w,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(ImageHelper.profileIcon),
                  ),
                ),
                AppSpacer.vertical.space5,
                Text(
                  AppString.admin,
                  style: context.displaySmall,
                ),
                AppSpacer.vertical.space15,
                InkWell(
                  onTap: () {
                    context.router.replace(const UsersRoute());
                  },
                  child: Container(
                    width: gestureContainerWidth.w,
                    height: gestureContainerHeight.h,
                    decoration: containerDecoration(context.primaryColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppSpacer.horizontal.space20,
                        Image.asset(
                          ImageHelper.users,
                          width: iconSize.w,
                          height: iconSize.h,
                        ),
                        AppSpacer.horizontal.space20,
                        Expanded(
                          child: SizedBox(
                            width: textBox.w,
                            child: Text(
                              AppString.users,
                              style: context.displaySmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
