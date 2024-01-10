import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/containers/home_container.dart';
import 'package:take_data_and_update_project/product/widgets/text/home_page_text.dart';

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
            const _MyDevices(
              bigContainerWidth: bigContainerWidth,
              bigContainerHeight: bigContainerHeight,
            ),
            AppSpacer.vertical.space30,
            const _AlertBox(
              bigContainerWidth: bigContainerWidth,
              smallContainerHeight: smallContainerHeight,
            ),
            AppSpacer.vertical.space30,
            _Settings(
              userModel: userModel,
              mediumContainerWidth: mediumContainerWidth,
              smallContainerHeight: smallContainerHeight,
            ),
            AppSpacer.vertical.space30,
            const _RateUs(
              smallContainerWidth: smallContainerWidth,
              smallContainerHeight: smallContainerHeight,
            ),
            AppSpacer.vertical.space30,
          ],
        ),
      ),
    );
  }
}

class _RateUs extends StatelessWidget {
  const _RateUs({
    required this.smallContainerWidth,
    required this.smallContainerHeight,
  });

  final int smallContainerWidth;
  final int smallContainerHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: HomeContainer(
        width: smallContainerWidth,
        height: smallContainerHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HomePageText(value: LocaleKeys.homePage_rateUs),
            AppSpacer.vertical.space10,
            Assets.icons.starsIcon.svg(),
          ],
        ),
      ),
    );
  }
}

class _Settings extends StatelessWidget {
  const _Settings({
    required this.userModel,
    required this.mediumContainerWidth,
    required this.smallContainerHeight,
  });

  final UserModel userModel;
  final int mediumContainerWidth;
  final int smallContainerHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          context.router.push(SettingsRoute(userModel: userModel));
        },
        child: HomeContainer(
          width: mediumContainerWidth,
          height: smallContainerHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Assets.icons.settingsIcon.svg(),
              const HomePageText(value: LocaleKeys.homePage_settings),
            ],
          ),
        ),
      ),
    );
  }
}

class _AlertBox extends StatelessWidget {
  const _AlertBox({
    required this.bigContainerWidth,
    required this.smallContainerHeight,
  });

  final int bigContainerWidth;
  final int smallContainerHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: HomeContainer(
        width: bigContainerWidth,
        height: smallContainerHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Assets.icons.overheatIcon.image(width: 70.w, height: 62.h),
            const HomePageText(value: LocaleKeys.homePage_alertBox),
          ],
        ),
      ),
    );
  }
}

class _MyDevices extends StatelessWidget {
  const _MyDevices({
    required this.bigContainerWidth,
    required this.bigContainerHeight,
  });

  final int bigContainerWidth;
  final int bigContainerHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: HomeContainer(
        width: bigContainerWidth,
        height: bigContainerHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.phoneIcon.image(
              width: 120.w,
              height: 120.h,
            ),
            AppSpacer.vertical.space5,
            const HomePageText(value: LocaleKeys.homePage_myDevices),
          ],
        ),
      ),
    );
  }
}
