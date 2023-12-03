import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/core/constants/app_string.dart';
import 'package:take_data_and_update_project/core/constants/img_helper.dart';
import 'package:take_data_and_update_project/core/util/app_spacer.dart';
import 'package:take_data_and_update_project/core/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/src/features/common/main_container_decoration.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                    Text(
                      "Yiğit Tilki",
                      style: context.headLineSmall,
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
        title: const Text("${AppString.welcome} Yiğit Tilki"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacer.vertical.space30,
            Container(
              width: bigContainerWidth.w,
              height: bigConttainerHeight.h,
              decoration: containerDecoration(context.primaryColor),
            ),
            AppSpacer.vertical.space30,
            Container(
              width: bigContainerWidth.w,
              height: smallConttainerHeight.h,
              decoration: containerDecoration(context.primaryColor),
            ),
            AppSpacer.vertical.space30,
            Container(
              width: mediumContainerWidth.w,
              height: smallConttainerHeight.h,
              decoration: containerDecoration(context.primaryColor),
            ),
            AppSpacer.vertical.space30,
            Container(
              width: smallContainerWidth.w,
              height: smallConttainerHeight.h,
              decoration: containerDecoration(context.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
