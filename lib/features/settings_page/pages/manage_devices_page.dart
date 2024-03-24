import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/settings_page/mixin/manage_devices_mixin.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';

@RoutePage()
class ManageDevicesPage extends ConsumerStatefulWidget {
  const ManageDevicesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ManageDevicesPageState();
}

class _ManageDevicesPageState extends ConsumerState<ManageDevicesPage>
    with ManageDevicesMixin {
  @override
  Widget build(BuildContext context) {
    const iconSize = 25;
    return Scaffold(
      backgroundColor: context.secondaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            AppSpacer.vertical.space5,
            const _Header(),
            AppSpacer.vertical.space10,
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: ProjectPadding.symHNormal() +
                        ProjectPadding.symVXSmall(),
                    child: Container(
                      height: 60.h,
                      decoration: ShapeDecoration(
                        color: context.fourthColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                          side: BorderSide(
                            color: context.primaryColor,
                            width: 2.sp,
                          ),
                        ),
                      ),
                      child: Center(
                        child: ListTile(
                          onTap: () {},
                          leading: Assets.icons.manageDeviceIcon.image(
                            width: iconSize.w,
                            height: iconSize.h,
                          ),
                          title: const Text('Temp 1'),
                          subtitle: const Text('Coni'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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
      icon: Assets.icons.manageDeviceIcon.image(),
      text: LocaleKeys.settingsPage_manageDevices,
      needBackButton: true,
    );
  }
}
