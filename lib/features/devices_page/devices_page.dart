import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/search_text_field.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/providers/device_list_provider.dart';
import 'package:take_data_and_update_project/product/service/devices_service.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/date_time.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/util/show_dialog.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';
import 'package:take_data_and_update_project/product/widgets/text/medium_text.dart';

@RoutePage()
class DevicesPage extends ConsumerStatefulWidget {
  const DevicesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DevicesPageState();
}

class _DevicesPageState extends ConsumerState<DevicesPage> {
  final TextEditingController searchTextController = TextEditingController();
  final TextEditingController deviceIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceListState = ref.watch(deviceListProvider);
    return Scaffold(
      backgroundColor: context.secondaryColor,
      resizeToAvoidBottomInset: false,
      floatingActionButton: _AddDeviceButton(
        context: context,
        deviceIdController: deviceIdController,
      ),
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
                Divider(
                  endIndent: 6.w,
                  indent: 6.w,
                  thickness: 3.h,
                  color: context.primaryColor,
                ),
                AppSpacer.vertical.space5,
                deviceListState.maybeWhen(
                  data: (data) {
                    final filteredList = data
                        .where(
                          (device) =>
                              (device.id != null &&
                                  device.id!.toLowerCase().contains(
                                        searchTextController.text.toLowerCase(),
                                      )) ||
                              (device.userId != null &&
                                  device.userId!.toLowerCase().contains(
                                        searchTextController.text.toLowerCase(),
                                      )),
                        )
                        .toList();
                    return Expanded(
                      child: ListView.builder(
                        itemCount: filteredList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final device = filteredList[index];
                          return Padding(
                            padding: ProjectPadding.symHXXSmall() +
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
                                      AlertDialog(
                                        titlePadding: ProjectPadding.allSmall(),
                                        contentPadding:
                                            ProjectPadding.symHXXLarge(),
                                        shape: Decorations.popUpDecoration(
                                          context.fourthColor,
                                        ),
                                        title: MediumText(value: device.id!),
                                        actions: [
                                          MediumText(
                                            value: device.type ?? 'Unassigned',
                                          ),
                                          MediumText(
                                            value:
                                                device.userId ?? 'Unassigned',
                                          ),
                                          MediumText(
                                            value:
                                                'IsActive ${device.isActive}',
                                          ),
                                          MediumText(
                                            value: device.createdAtByAdmin ??
                                                'Unassigned',
                                          ),
                                          MediumText(
                                            value: device.createdAtByUser ??
                                                'Unassigned',
                                          ),
                                          MediumText(
                                            value: device.deviceName ??
                                                'Unassigned',
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  leading: Assets.icons.manageDeviceIcon.image(
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                  title: Text(
                                    '${device.id}',
                                    style: context.titleMedium,
                                  ),
                                  subtitle: Text(
                                    device.userId != null
                                        ? '${device.userId}'
                                        : 'Unassigned',
                                    style: context.titleMedium,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AddDeviceButton extends ConsumerWidget {
  const _AddDeviceButton({
    required this.context,
    required this.deviceIdController,
  });
  final BuildContext context;
  final TextEditingController deviceIdController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? deviceType;
    return FloatingActionButton(
      onPressed: () async {
        final typeList = await DeviceService().getDeviceTypes();
        if (!context.mounted) return;
        await showModalBottomSheet<Widget>(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, states) {
                return Form(
                  child: Container(
                    decoration: Decorations.borderContainerDecoration(
                      context.secondaryColor,
                      context.primaryColor,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AppSpacer.vertical.space20,
                          CustomHeader(
                            icon: Assets.icons.manageDeviceIcon.image(),
                            text: 'Add Device',
                            needBackButton: false,
                          ),
                          AppSpacer.vertical.space10,
                          AuthTextFormField(
                            hintText: 'Device Id',
                            validator: (validator) {
                              return null;
                            },
                            controller: deviceIdController,
                            keyboardType: TextInputType.text,
                          ),
                          AppSpacer.vertical.space10,
                          DropdownButton(
                            underline: Container(
                              height: 2.h,
                              color: context.fourthColor,
                            ),
                            borderRadius: BorderRadius.circular(15.sp),
                            hint: const MediumText(value: 'Select Type'),
                            onChanged: (onChanged) {
                              states(() {
                                deviceType = onChanged;
                              });
                            },
                            value: deviceType,
                            items: typeList.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: MediumText(value: e),
                              );
                            }).toList(),
                          ),
                          AppSpacer.vertical.space10,
                          BorderedElevatedButton(
                            onPressed: () async {
                              if (deviceType == null) {
                                scaffoldMessenger(context, 'Must be Type');
                              } else {
                                await DeviceService().addDevice(
                                  DeviceModel(
                                    id: deviceIdController.text,
                                    type: deviceType,
                                    isActive: false,
                                    createdAtByAdmin:
                                        MyDateTime().getDateTime(),
                                  ),
                                );
                                ref.invalidate(deviceListProvider);
                              }
                            },
                            text: 'Add Device',
                          ),
                          AppSpacer.vertical.space30,
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
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
      text: LocaleKeys.usersPage_devices,
      needBackButton: true,
    );
  }
}
