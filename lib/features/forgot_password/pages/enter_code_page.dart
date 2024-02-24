import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/features/forgot_password/mixins/enter_code_mixin.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';

@RoutePage()
class EnterCodePage extends StatefulWidget {
  const EnterCodePage({required this.code, required this.email, super.key});
  final int code;
  final String email;

  @override
  State<EnterCodePage> createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> with EnterCodeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            AppSpacer.vertical.space10,
            CustomHeader(
              icon: Assets.icons.manageDeviceIcon.image(),
              text: 'Enter Code',
              needBackButton: true,
            ),
            AppSpacer.vertical.space20,
            AuthTextFormField(
              hintText: 'Enter Code',
              validator: (validator) {
                return null;
              },
              controller: codeController,
              keyboardType: TextInputType.number,
            ),
            AppSpacer.vertical.space10,
            BorderedElevatedButton(
              onPressed: elevatedButtonProcess,
              text: 'Change Password',
            ),
          ],
        ),
      ),
    );
  }
}
