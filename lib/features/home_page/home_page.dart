import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/common/decorations.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';

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
      resizeToAvoidBottomInset: false,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.phoneIcon.image(
                      width: 100.w,
                      height: 120.h,
                    ),
                    Text(
                      LocaleKeys.homePage_myDevices.tr(),
                      style: context.displaySmall,
                    ),
                  ],
                ),
              ),
            ),
            AppSpacer.vertical.space30,
            Expanded(
              child: Container(
                width: bigContainerWidth.w,
                height: smallContainerHeight.h,
                decoration:
                    Decorations.containerDecoration(context.primaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Assets.icons.overheatIcon.image(width: 70.w, height: 62.h),
                    Text(
                      LocaleKeys.homePage_alertBox.tr(),
                      style: context.headlineLarge,
                    ),
                  ],
                ),
              ),
            ),
            AppSpacer.vertical.space30,
            Expanded(
              child: Container(
                width: mediumContainerWidth.w,
                height: smallContainerHeight.h,
                decoration:
                    Decorations.containerDecoration(context.primaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Assets.icons.settingsIcon.svg(),
                    Text(
                      LocaleKeys.homePage_settings.tr(),
                      style: context.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            AppSpacer.vertical.space30,
            Expanded(
              child: Container(
                width: smallContainerWidth.w,
                height: smallContainerHeight.h,
                decoration:
                    Decorations.containerDecoration(context.primaryColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.homePage_rateUs.tr(),
                      style: context.headlineMedium,
                    ),
                    AppSpacer.vertical.space10,
                    Assets.icons.starsIcon.svg(),
                  ],
                ),
              ),
            ),
            AppSpacer.vertical.space30,
          ],
        ),
      ),
    );
  }
}
