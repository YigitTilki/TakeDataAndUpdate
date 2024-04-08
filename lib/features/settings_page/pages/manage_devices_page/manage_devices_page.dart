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

part 'widgets/user_device_list.dart';

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
  @override
  Widget build(BuildContext context) {
    final deviceList =
        ref.watch(userDeviceListProvider(widget.userModel.id.toString()));

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
                    return _DevicesList(devices: devices);
                  },
                  loading: () => Assets.lottie.loading.lottie(height: 50.h),
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
