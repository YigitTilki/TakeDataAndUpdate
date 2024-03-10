import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/auth/widgets/password_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/re_password_field.dart';
import 'package:take_data_and_update_project/features/forgot_password/mixins/reset_password_mixin.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/providers/visibility_providers.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';
import 'package:take_data_and_update_project/product/widgets/pop_scope.dart';

@RoutePage()
class ResetPasswordPage extends ConsumerStatefulWidget {
  const ResetPasswordPage({required this.email, super.key});
  final String email;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ConsumerState<ResetPasswordPage>
    with ResetPasswordMixin {
  @override
  Widget build(BuildContext context) {
    final passwordVisible1 =
        ref.watch(passwordVisibilityProviderResetPassword1);
    final passwordVisible2 =
        ref.watch(passwordVisibilityProviderResetPassword2);

    return GoLoginPopScope(
      child: Scaffold(
        backgroundColor: context.secondaryColor,
        body: SafeArea(
          child: Form(
            key: formKeyResetPassword,
            child: Column(
              children: [
                AppSpacer.vertical.space10,
                const _Header(),
                AppSpacer.vertical.space20,
                PasswordField(
                  passwordTextController: passwordTextController,
                  onPressed: () => ref
                      .read(passwordVisibilityProviderResetPassword1.notifier)
                      .state = !passwordVisible1,
                  isPasswordVisible: passwordVisible1,
                  isLogin: false,
                ),
                AppSpacer.vertical.space10,
                RePasswordField(
                  rePasswordTextController: rePasswordTextController,
                  onPressedIcon: () => ref
                      .read(passwordVisibilityProviderResetPassword2.notifier)
                      .state = !passwordVisible2,
                  isPasswordVisible: passwordVisible2,
                  passwordTextController: passwordTextController,
                ),
                AppSpacer.vertical.space10,
                BorderedElevatedButton(
                  onPressed: elevatedButtonProcess,
                  text: LocaleKeys.forgotPassword_changePassword,
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
      text: LocaleKeys.forgotPassword_newPassword,
      needBackButton: false,
    );
  }
}
