import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/auth/register_page/mixin/register_page_mixin.dart';
import 'package:take_data_and_update_project/features/auth/widgets/auth_view.dart.dart';
import 'package:take_data_and_update_project/features/auth/widgets/email_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/first_name_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/last_name_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/password_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/re_password_field.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/providers/visibility_providers.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/text_button.dart';
import 'package:take_data_and_update_project/product/widgets/text/header_text.dart';
import 'package:take_data_and_update_project/product/widgets/text/small_info_text.dart';

part 'widgets/already_have_account.dart';

@RoutePage()
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  static final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage>
    with RegisterPageMixin {
  @override
  Widget build(BuildContext context) {
    final passwordVisible1 = ref.watch(passwordVisibilityProvider1);
    final passwordVisible2 = ref.watch(passwordVisibilityProvider2);

    return Scaffold(
      backgroundColor: context.secondaryColor,
      body: SafeArea(
        child: Form(
          key: RegisterPage.formKeyRegister,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AuthHeader(),
                AppSpacer.vertical.space30,
                const HeaderText(
                  value: LocaleKeys.registerPage_signUpUpperCase,
                ),
                AppSpacer.vertical.space20,
                FirstNameField(firstNameController: firstNameController),
                AppSpacer.vertical.space20,
                LastNameField(lastNameController: lastNameController),
                AppSpacer.vertical.space20,
                PasswordField(
                  passwordTextController: passwordTextController,
                  onPressed: () => ref
                      .read(passwordVisibilityProvider1.notifier)
                      .state = !passwordVisible1,
                  isPasswordVisible: passwordVisible1,
                  isLogin: false,
                ),
                AppSpacer.vertical.space20,
                RePasswordField(
                  rePasswordTextController: rePasswordTextController,
                  isPasswordVisible: passwordVisible2,
                  passwordTextController: passwordTextController,
                  onPressedIcon: () => ref
                      .read(passwordVisibilityProvider2.notifier)
                      .state = !passwordVisible2,
                ),
                AppSpacer.vertical.space20,
                EmailField(
                  //TODO: tolowerCase indirge
                  emailTextController: emailTextController,
                  isLogin: false,
                ),
                AppSpacer.vertical.space20,
                AppElevatedButton(
                  text: LocaleKeys.registerPage_signUpUpperCase,
                  onPressed: elevatedButtonProcess,
                ),
                const _AlreadyHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
