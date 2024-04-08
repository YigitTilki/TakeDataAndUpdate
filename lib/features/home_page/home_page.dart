import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/service/devices_service.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/containers/home_container.dart';
import 'package:take_data_and_update_project/product/widgets/pop_scope.dart';
import 'package:take_data_and_update_project/product/widgets/text/large_text.dart';

part 'widgets/alert_box.dart';
part 'widgets/my_devices.dart';
part 'widgets/rate_us.dart';
part 'widgets/settings.dart';
part 'widgets/user_info_container.dart';

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

    return MyPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: context.secondaryColor,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacer.vertical.space30,
              _UserInfoContainer(
                bigContainerWidth: bigContainerWidth,
                smallContainerHeight: smallContainerHeight,
                userModel: userModel,
              ),
              AppSpacer.vertical.space30,
              _MyDevices(
                bigContainerWidth: bigContainerWidth,
                bigContainerHeight: bigContainerHeight,
                userModel: userModel,
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
      ),
    );
  }
}
