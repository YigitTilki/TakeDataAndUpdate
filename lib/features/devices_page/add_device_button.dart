import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/features/devices_page/add_devices_mixin.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/service/devices_service.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';
import 'package:take_data_and_update_project/product/widgets/text/medium_text.dart';

class AddDeviceButton extends ConsumerStatefulWidget {
  const AddDeviceButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddDeviceButtonState();
}

class _AddDeviceButtonState extends ConsumerState<AddDeviceButton>
    with AddDevicesMixin {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final typeList = await DeviceService().getDeviceTypes();
        if (!context.mounted) return;
        await showModalBottomSheet<Widget>(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, states) {
                return Padding(
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
                          const _Header(),
                          AppSpacer.vertical.space10,
                          DeviceIdFormField(
                            deviceIdController: deviceIdController,
                          ),
                          AppSpacer.vertical.space10,
                          DropdownButton(
                            underline: Container(
                              height: 2.h,
                              color: context.fourthColor,
                            ),
                            borderRadius: BorderRadius.circular(15.sp),
                            hint: const MediumText(
                              value: LocaleKeys.devicesPage_selectType,
                            ),
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
                            onPressed: elevatedButtonProcess,
                            text: LocaleKeys.devicesPage_addDevice,
                          ),
                          AppSpacer.vertical.space20,
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

class DeviceIdFormField extends StatelessWidget {
  const DeviceIdFormField({
    required this.deviceIdController,
    super.key,
  });

  final TextEditingController deviceIdController;

  @override
  Widget build(BuildContext context) {
    return AuthTextFormField(
      hintText: LocaleKeys.devicesPage_deviceId,
      validator: (validator) {
        return null;
      },
      controller: deviceIdController,
      keyboardType: TextInputType.text,
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      icon: Assets.icons.manageDeviceIcon.image(),
      text: LocaleKeys.devicesPage_addDevice,
      needBackButton: false,
    );
  }
}
