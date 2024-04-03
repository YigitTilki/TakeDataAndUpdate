import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/features/devices_page/device_credentials_pop_up.dart';
import 'package:take_data_and_update_project/features/settings_page/mixin/manage_devices_mixin.dart';
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
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

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

    return Scaffold(
      backgroundColor: context.secondaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<Widget>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Form(
                key: formKey,
                child: Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Container(
                    decoration: Decorations.borderContainerDecoration(
                      context.secondaryColor,
                      context.primaryColor,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AppSpacer.vertical.space20,
                          const _Header2(),
                          AppSpacer.vertical.space10,
                          AuthTextFormField(
                            hintText: 'Device Id',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Boş Bırakılamaz';
                              }
                              return null;
                            },
                            controller: deviceIdController,
                            keyboardType: TextInputType.text,
                          ),
                          AppSpacer.vertical.space10,
                          AuthTextFormField(
                            hintText: 'Set Device Name',
                            validator: (value) {
                              if (value!.length <= 3 || value.isEmpty) {
                                return 'İsim 2 haneden uzun olmalıdır';
                              }
                              return null;
                            },
                            controller: deviceNameController,
                            keyboardType: TextInputType.text,
                          ),
                          AppSpacer.vertical.space10,
                          BorderedElevatedButton(
                            onPressed: elevatedButtonProcess,
                            text: 'Add',
                          ),
                          AppSpacer.vertical.space20,
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            AppSpacer.vertical.space5,
            const _Header(),
            AppSpacer.vertical.space10,
            Expanded(
              child: deviceList.when(
                data: (devices) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      ref.invalidate(userDeviceListProvider);
                    },
                    child: ListView.builder(
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
                                          AlertDialog(
                                            actionsAlignment:
                                                MainAxisAlignment.center,
                                            contentPadding:
                                                ProjectPadding.symHXXLarge() +
                                                    ProjectPadding.topXXLarge(),
                                            shape: Decorations.popUpDecoration(
                                              context.fourthColor,
                                            ),
                                            content: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  PopUpText(
                                                    text1: LocaleKeys
                                                        .devicesPage_deviceIdPopUp,
                                                    text2: deviceModel.id!,
                                                  ),
                                                  Divider(
                                                    color: context.fourthColor,
                                                  ),
                                                  PopUpText(
                                                    text1: LocaleKeys
                                                        .devicesPage_deviceTypePopUp,
                                                    text2: deviceModel.type!,
                                                  ),
                                                  Divider(
                                                    color: context.fourthColor,
                                                  ),
                                                  PopUpText(
                                                    text1: LocaleKeys
                                                        .devicesPage_createdDateByAdminPopUp,
                                                    text2: deviceModel
                                                        .createdAtByAdmin!,
                                                  ),
                                                  Divider(
                                                    color: context.fourthColor,
                                                  ),
                                                  PopUpText(
                                                    text1: LocaleKeys
                                                        .devicesPage_deviceStatusPopUp,
                                                    text2: deviceModel.isActive!
                                                        ? LocaleKeys
                                                            .devicesPage_active
                                                        : LocaleKeys
                                                            .devicesPage_passive,
                                                  ),
                                                  Divider(
                                                    color: context.fourthColor,
                                                  ),
                                                  PopUpText(
                                                    text1: LocaleKeys
                                                        .devicesPage_createdDateByUserPopUp,
                                                    text2: deviceModel
                                                        .createdAtByUser!,
                                                  ),
                                                  Divider(
                                                    color: context.fourthColor,
                                                  ),
                                                  PopUpText(
                                                    text1: LocaleKeys
                                                        .devicesPage_userIdPopUP,
                                                    text2: deviceModel.userId!,
                                                  ),
                                                  Divider(
                                                    color: context.fourthColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child:
                                                        BorderedElevatedButton(
                                                      onPressed: () async {
                                                        await showModalBottomSheet<
                                                            Widget>(
                                                          context: context,
                                                          isScrollControlled:
                                                              true,
                                                          builder: (
                                                            BuildContext
                                                                context,
                                                          ) {
                                                            return Form(
                                                              key: formKey,
                                                              child: Padding(
                                                                padding:
                                                                    MediaQuery
                                                                        .of(
                                                                  context,
                                                                ).viewInsets,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      Decorations
                                                                          .borderContainerDecoration(
                                                                    context
                                                                        .secondaryColor,
                                                                    context
                                                                        .primaryColor,
                                                                  ),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        AppSpacer
                                                                            .vertical
                                                                            .space20,
                                                                        const _Header2(),
                                                                        AppSpacer
                                                                            .vertical
                                                                            .space10,
                                                                        AuthTextFormField(
                                                                          hintText:
                                                                              'Update Device Name',
                                                                          validator:
                                                                              (value) {
                                                                            if (value!.length <= 3 ||
                                                                                value.isEmpty) {
                                                                              return 'İsim 2 haneden uzun olmalıdır';
                                                                            }
                                                                            return null;
                                                                          },
                                                                          controller:
                                                                              updateDeviceNameController,
                                                                          keyboardType:
                                                                              TextInputType.text,
                                                                        ),
                                                                        AppSpacer
                                                                            .vertical
                                                                            .space10,
                                                                        BorderedElevatedButton(
                                                                          onPressed:
                                                                              () async {
                                                                            await DeviceService().updateDeviceName(
                                                                              deviceModel.id.toString(),
                                                                              updateDeviceNameController.text,
                                                                            );
                                                                            if (!mounted) {
                                                                              return;
                                                                            }
                                                                            await context.router.pop();
                                                                            ref.invalidate(
                                                                              userDeviceListProvider,
                                                                            );
                                                                          },
                                                                          text:
                                                                              'Update Device Name',
                                                                        ),
                                                                        AppSpacer
                                                                            .vertical
                                                                            .space20,
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      text:
                                                          'Update Device Name',
                                                    ),
                                                  ),
                                                  AppSpacer.horizontal.space10,
                                                  Expanded(
                                                    child:
                                                        BorderedElevatedButton(
                                                      onPressed: () async {
                                                        scaffoldMessenger(
                                                          context,
                                                          'Device Deleted From Your Devices',
                                                        );
                                                        await DeviceService()
                                                            .deleteDeviceFromUser(
                                                          deviceId: deviceModel
                                                              .id
                                                              .toString(),
                                                        );
                                                        if (!mounted) return;
                                                        await context.router
                                                            .pop();
                                                        ref.invalidate(
                                                          userDeviceListProvider,
                                                        );
                                                      },
                                                      text: 'Delete Device',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
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
                    ),
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

class _Header2 extends StatelessWidget {
  const _Header2();

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      icon: Assets.icons.manageDeviceIcon.image(),
      text: LocaleKeys.devicesPage_addDevice,
      needBackButton: false,
    );
  }
}
