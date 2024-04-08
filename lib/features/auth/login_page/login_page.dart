import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/auth/login_page/mixin/login_page_mixin.dart';
import 'package:take_data_and_update_project/features/auth/widgets/auth_view.dart.dart';
import 'package:take_data_and_update_project/features/auth/widgets/email_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/password_field.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/providers/visibility_providers.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/text_button.dart';
import 'package:take_data_and_update_project/product/widgets/pop_scope.dart';
import 'package:take_data_and_update_project/product/widgets/text/header_text.dart';
import 'package:take_data_and_update_project/product/widgets/text/small_info_text.dart';

part 'widgets/not_a_member_yet.dart';
part 'widgets/remember_me_forgot_password.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> with LoginPageMixin {
  @override
  Widget build(BuildContext context) {
    final passwordVisible = ref.watch(passwordVisibilityProvider);
    final rememberMe = ref.watch(checkBoxProvider);

    return MyPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: context.secondaryColor,
        body: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const AuthHeader(),
                  AppSpacer.vertical.space100,
                  const HeaderText(value: LocaleKeys.commons_loginUpperCase),
                  AppSpacer.vertical.space20,
                  EmailField(
                    emailTextController: emailTextController,
                    isLogin: true,
                  ),
                  AppSpacer.vertical.space20,
                  PasswordField(
                    passwordTextController: passwordTextController,
                    onPressed: () => ref
                        .read(passwordVisibilityProvider.notifier)
                        .state = !passwordVisible,
                    isPasswordVisible: passwordVisible,
                    isLogin: true,
                  ),
                  AppSpacer.vertical.space20,
                  AppElevatedButton(
                    text: LocaleKeys.commons_loginUpperCase,
                    onPressed: elevatedButtonProcess,
                  ),
                  AppSpacer.vertical.space10,
                  _RememberMeForgotPassword(
                    value: rememberMe,
                    onChanged: checkBoxProcess,
                  ),
                  const _NotAMemberYet(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
