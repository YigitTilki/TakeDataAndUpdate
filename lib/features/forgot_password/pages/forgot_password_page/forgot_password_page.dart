import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/auth/widgets/email_field.dart';
import 'package:take_data_and_update_project/features/forgot_password/pages/forgot_password_page/forgot_password_mixin.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';

@RoutePage()
class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage>
    with ForgotPasswordMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.secondaryColor,
      body: SafeArea(
        child: Form(
          key: formKeyForgotPassword,
          child: Column(
            children: [
              const _Header(),
              AppSpacer.vertical.space20,
              EmailField(
                emailTextController: emailTextController,
                isLogin: false,
              ),
              AppSpacer.vertical.space10,
              BorderedElevatedButton(
                onPressed: elevatedButtonProcess,
                text: LocaleKeys.forgotPassword_sendEmailToResetPassword,
              ),
            ],
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
      icon: Assets.icons.forgotPasswordIcon.image(),
      text: LocaleKeys.loginPage_forgotPassWord,
      needBackButton: true,
    );
  }
}
