import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/manage_devices_page/widgets/update_device_name_popup/update_device_name_popup_mixin.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';

class UpdateDeviceNamePopUp extends ConsumerStatefulWidget {
  const UpdateDeviceNamePopUp({required this.deviceModel, super.key});
  final DeviceModel deviceModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateDeviceNamePopUpState();
}

class _UpdateDeviceNamePopUpState extends ConsumerState<UpdateDeviceNamePopUp>
    with UpdateDeviceNamePopUpMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: MediaQuery.of(
          context,
        ).viewInsets,
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
                AuthTextFormField(
                  hintText: 'Update Device Name',
                  validator: (value) {
                    if (value!.length <= 3 || value.isEmpty) {
                      return 'İsim 2 haneden uzun olmalıdır';
                    }
                    return null;
                  },
                  controller: updateDeviceNameController,
                  keyboardType: TextInputType.text,
                ),
                AppSpacer.vertical.space10,
                BorderedElevatedButton(
                  onPressed: elevatedButtonProcess,
                  text: 'Update Device Name',
                ),
                AppSpacer.vertical.space20,
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
      text: LocaleKeys.settingsPage_manageDevices,
      needBackButton: true,
    );
  }
}
