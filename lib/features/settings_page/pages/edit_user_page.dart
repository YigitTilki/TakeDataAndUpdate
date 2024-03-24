import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/auth/widgets/email_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/first_name_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/last_name_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/password_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/re_password_field.dart';
import 'package:take_data_and_update_project/features/settings_page/mixin/edit_user_mixin.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/providers/visibility_providers.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';

@RoutePage()
class EditUserPage extends ConsumerStatefulWidget {
  const EditUserPage({required this.userModel, super.key});
  final UserModel userModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditUserPageState();
}

class _EditUserPageState extends ConsumerState<EditUserPage>
    with EditUserMixin {
  @override
  Widget build(BuildContext context) {
    final passwordVisible1 = ref.watch(passwordVisibilityProvider1);
    final passwordVisible2 = ref.watch(passwordVisibilityProvider2);
    return Scaffold(
      backgroundColor: context.secondaryColor,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppSpacer.vertical.space5,
                const _Header(),
                AppSpacer.vertical.space30,
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
                  onPressedIcon: () => ref
                      .read(passwordVisibilityProvider2.notifier)
                      .state = !passwordVisible2,
                  isPasswordVisible: passwordVisible2,
                  passwordTextController: passwordTextController,
                ),
                AppSpacer.vertical.space20,
                EmailField(
                  emailTextController: emailTextController,
                  isLogin: false,
                ),
                AppSpacer.vertical.space20,
                AppElevatedButton(
                  text: LocaleKeys.settingsPage_update,
                  onPressed: elevatedButtonProcess,
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
      icon: Assets.icons.updateProfileIcon.image(),
      text: LocaleKeys.usersPage_updateUser,
      needBackButton: true,
    );
  }
}
