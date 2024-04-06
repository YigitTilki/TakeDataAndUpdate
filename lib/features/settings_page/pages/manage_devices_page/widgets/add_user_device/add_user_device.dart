import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/manage_devices_page/widgets/add_user_device/add_user_device_mixin.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';

class AddUserDeviceButton extends ConsumerStatefulWidget {
  const AddUserDeviceButton({required this.userModel, super.key});
  final UserModel userModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddUserDeviceButtonState();
}

class _AddUserDeviceButtonState extends ConsumerState<AddUserDeviceButton>
    with AddUserDeviceMixin {
  @override
  Widget build(BuildContext context) {
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
                const _Header(),
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
