import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/auth/domain/user_model.dart';
import 'package:take_data_and_update_project/features/common/decorations.dart';
import 'package:take_data_and_update_project/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/util/constants/app_spacer.dart';
import 'package:take_data_and_update_project/util/constants/img_helper.dart';
import 'package:take_data_and_update_project/util/extensions/build_context_extension.dart';

part 'widgets/app_bar.dart';
part 'widgets/drawer.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({required this.userModel, super.key});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    const smallContainerHeight = 76;
    const bigContainerHeight = 202;
    const bigContainerWidth = 260;
    const mediumContainerWidth = 200;
    const smallContainerWidth = 120;

    return Scaffold(
      drawer: _HomePageDrawer(userModel),
      backgroundColor: context.secondaryColor,
      appBar: _HomePageAppBar(userModel),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacer.vertical.space30,
            Expanded(
              flex: 2,
              child: Container(
                width: bigContainerWidth.w,
                height: bigContainerHeight.h,
                decoration:
                    Decorations.containerDecoration(context.primaryColor),
              ),
            ),
            AppSpacer.vertical.space30,
            Expanded(
              child: Container(
                width: bigContainerWidth.w,
                height: smallContainerHeight.h,
                decoration:
                    Decorations.containerDecoration(context.primaryColor),
              ),
            ),
            AppSpacer.vertical.space30,
            Expanded(
              child: Container(
                width: mediumContainerWidth.w,
                height: smallContainerHeight.h,
                decoration:
                    Decorations.containerDecoration(context.primaryColor),
              ),
            ),
            AppSpacer.vertical.space30,
            Expanded(
              child: Container(
                width: smallContainerWidth.w,
                height: smallContainerHeight.h,
                decoration:
                    Decorations.containerDecoration(context.primaryColor),
              ),
            ),
            AppSpacer.vertical.space30,
          ],
        ),
      ),
    );
  }
}
