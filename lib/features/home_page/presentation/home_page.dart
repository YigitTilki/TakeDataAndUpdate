import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/common/main_container_decoration.dart';
import 'package:take_data_and_update_project/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/util/app_spacer.dart';
import 'package:take_data_and_update_project/util/constants/img_helper.dart';
import 'package:take_data_and_update_project/util/extensions/build_context_extension.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  final String displayName;
  const HomePage({super.key, required this.displayName});

  @override
  Widget build(BuildContext context) {
    const int smallConttainerHeight = 76;
    const int bigConttainerHeight = 202;
    const int bigContainerWidth = 260;
    const int mediumContainerWidth = 200;
    const int smallContainerWidth = 120;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.only(bottom: 0.h),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 80.h,
                      width: 80.w,
                      child: const CircleAvatar(
                        backgroundImage: AssetImage(ImageHelper.profileIcon),
                      ),
                    ),
                    AppSpacer.vertical.space5,
                    Expanded(
                      child: Text(
                        displayName,
                        overflow: TextOverflow.ellipsis,
                        style: context.headlineLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: context.secondaryColor,
      appBar: AppBar(
        title: Text("${LocaleKeys.homePage_welcome} $displayName").tr(),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacer.vertical.space30,
            Expanded(
              flex: 2,
              child: Container(
                width: bigContainerWidth.w,
                height: bigConttainerHeight.h,
                decoration: containerDecoration(context.primaryColor),
              ),
            ),
            AppSpacer.vertical.space30,
            Expanded(
              child: Container(
                width: bigContainerWidth.w,
                height: smallConttainerHeight.h,
                decoration: containerDecoration(context.primaryColor),
              ),
            ),
            AppSpacer.vertical.space30,
            Expanded(
              child: Container(
                width: mediumContainerWidth.w,
                height: smallConttainerHeight.h,
                decoration: containerDecoration(context.primaryColor),
              ),
            ),
            AppSpacer.vertical.space30,
            Expanded(
              child: Container(
                width: smallContainerWidth.w,
                height: smallConttainerHeight.h,
                decoration: containerDecoration(context.primaryColor),
              ),
            ),
            AppSpacer.vertical.space30,
          ],
        ),
      ),
    );
  }
}
