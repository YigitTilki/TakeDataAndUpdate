import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/auth/widgets/search_text_field.dart';
import 'package:take_data_and_update_project/features/devices_page/add_device_button.dart';
import 'package:take_data_and_update_project/features/users_page/widgets/app_divider.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/providers/device_list_provider.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/util/show_dialog.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';

part 'device_credentials_pop_up.dart';
part 'devices_list.dart';

@RoutePage()
class DevicesPage extends ConsumerStatefulWidget {
  const DevicesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DevicesPageState();
}

class _DevicesPageState extends ConsumerState<DevicesPage> {
  final TextEditingController searchTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceListState = ref.watch(deviceListProvider);
    return Scaffold(
      backgroundColor: context.secondaryColor,
      resizeToAvoidBottomInset: false,
      floatingActionButton: const AddDeviceFloatingActionButton(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: ProjectPadding.allSmall(),
            child: Column(
              children: [
                const _Header(),
                AppSpacer.vertical.space20,
                SearchTextField(
                  searchTextController: searchTextController,
                  onChanged: (value) {
                    if (deviceListState is AsyncData<List<DeviceModel>>) {
                      ref.read(deviceListNotifierProvider.notifier).filterUsers(
                            value,
                            deviceListState.value.toList(),
                          );
                      ref.invalidate(deviceListProvider);
                    }
                  },
                ),
                AppSpacer.vertical.space5,
                const AppDivider(),
                AppSpacer.vertical.space5,
                _DevicesList(
                  searchTextController: searchTextController,
                ),
              ],
            ),
          ),
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
      text: LocaleKeys.usersPage_devices,
      needBackButton: true,
    );
  }
}
