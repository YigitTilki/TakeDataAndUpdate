import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/common/main_container_decoration.dart';
import 'package:take_data_and_update_project/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/init/languages/locales.dart';
import 'package:take_data_and_update_project/init/languages/product_localizations.dart';
import 'package:take_data_and_update_project/init/route/app_router.dart';
import 'package:take_data_and_update_project/util/app_spacer.dart';
import 'package:take_data_and_update_project/util/constants/img_helper.dart';
import 'package:take_data_and_update_project/util/extensions/build_context_extension.dart';

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
                  LocaleKeys.adminPage_admin,
                  style: context.displaySmall,
                ).tr(),
                AppSpacer.vertical.space15,
                InkWell(
                  onTap: () {
                    context.router.push(const UsersRoute());
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
                              LocaleKeys.adminPage_users,
                              style: context.displaySmall,
                            ).tr(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    ProductLocalizations.updateLanguage(
                      context: context,
                      value: Locales.en,
                    );
                  },
                  child: Text(
                    LocaleKeys.adminPage_admin,
                    style: context.bodyLarge,
                  ).tr(),
                ),
                ElevatedButton(
                  onPressed: () {
                    ProductLocalizations.updateLanguage(
                      context: context,
                      value: Locales.tr,
                    );
                  },
                  child: Text(
                    LocaleKeys.adminPage_admin,
                    style: context.bodyLarge,
                  ).tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
