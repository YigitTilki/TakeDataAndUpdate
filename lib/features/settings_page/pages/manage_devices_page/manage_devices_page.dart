import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/manage_devices_page/manage_devices_mixin.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/manage_devices_page/widgets/add_user_device/add_user_device.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/manage_devices_page/widgets/user_device_credentials_popup/user_device_credentials_popup.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/providers/device_list_provider.dart';
import 'package:take_data_and_update_project/product/service/devices_service.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/util/show_dialog.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';
import 'package:take_data_and_update_project/product/widgets/refresh_indicator.dart';

@RoutePage()
class ManageDevicesPage extends ConsumerStatefulWidget {
  const ManageDevicesPage({required this.userModel, super.key});
  final UserModel userModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ManageDevicesPageState();
}

class _ManageDevicesPageState extends ConsumerState<ManageDevicesPage>
    with ManageDevicesMixin {
  final TextEditingController updateDeviceNameController =
      TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    final deviceList =
        ref.watch(userDeviceListProvider(widget.userModel.id.toString()));

    const iconSize = 25;

    return MyRefreshIndicator(
      child: Scaffold(
        backgroundColor: context.secondaryColor,
        floatingActionButton: _FloatingActionButton(widget: widget),
        body: SafeArea(
          child: Column(
            children: [
              AppSpacer.vertical.space5,
              const _Header(),
              AppSpacer.vertical.space10,
              Expanded(
                child: deviceList.when(
                  data: (devices) {
                    return ListView.builder(
                      itemCount: devices.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FutureBuilder<DeviceModel?>(
                          future: DeviceService().getDevice(devices[index]),
                          builder: (
                            BuildContext context,
                            AsyncSnapshot<DeviceModel?> snapshot,
                          ) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Text(
                                'Error: ${snapshot.error}',
                              );
                            } else {
                              final deviceModel = snapshot.data;
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
                                      onTap: () {
                                        show(
                                          context,
                                          UserDeviceCredentialsPopUp(
                                            deviceModel: deviceModel,
                                          ),
                                        );
                                      },
                                      leading:
                                          Assets.icons.manageDeviceIcon.image(
                                        width: iconSize.w,
                                        height: iconSize.h,
                                      ),
                                      title: Text(
                                        deviceModel!.deviceName!,
                                      ),
                                      subtitle: const Text('Coni'),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                  loading: () => Scaffold(
                    backgroundColor: context.secondaryColor,
                    body: const Center(child: CircularProgressIndicator()),
                  ),
                  error: (error, stackTrace) => Text('Error: $error'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({
    required this.widget,
    super.key,
  });

  final ManageDevicesPage widget;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showBottom(
          context: context,
          widget: AddUserDeviceButton(userModel: widget.userModel),
        );
      },
      child: const Icon(Icons.add),
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
