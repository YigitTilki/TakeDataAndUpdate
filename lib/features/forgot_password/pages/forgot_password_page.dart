import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/auth/widgets/email_field.dart';
import 'package:take_data_and_update_project/features/forgot_password/mixins/forgot_password_mixin.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with ForgotPasswordMixin {
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
              text: 'Forgot Password',
              needBackButton: true,
            ),
            AppSpacer.vertical.space20,
            EmailField(
              emailTextController: emailTextController,
              isLogin: false,
            ),
            AppSpacer.vertical.space10,
            BorderedElevatedButton(
              onPressed: elevatedButtonProcess,
              text: 'Send Email to Reset Password',
            ),
          ],
        ),
      ),
    );
  }
}
