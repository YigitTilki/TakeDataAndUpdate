import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/auth/widgets/email_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/first_name_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/last_name_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/password_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/re_password_field.dart';
import 'package:take_data_and_update_project/features/settings_page/mixin/edit_user_mixin.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/custom_header.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

@RoutePage()
class EditUserPage extends StatefulWidget {
  const EditUserPage({required this.userModel, super.key});
  final UserModel userModel;
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> with EditUserMixin {
  @override
  void initState() {
    super.initState();
    firstNameController.text = widget.userModel.firstName.toString();
    lastNameController.text = widget.userModel.lastName.toString();
    passwordTextController.text = widget.userModel.password.toString();
    emailTextController.text = widget.userModel.email.toString();
  }

  bool _isPasswordVisible1 = true;
  bool _isPasswordVisible2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.secondaryColor,
      body: SafeArea(
        child: Form(
          key: EditUserPage._formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppSpacer.vertical.space20,
                CustomHeader(
                  icon: Assets.icons.updateProfileIcon.image(),
                  text: LocaleKeys.usersPage_updateUser,
                ),
                AppSpacer.vertical.space30,
                FirstNameField(firstNameController: firstNameController),
                AppSpacer.vertical.space20,
                LastNameField(lastNameController: lastNameController),
                AppSpacer.vertical.space20,
                PasswordField(
                  passwordTextController: passwordTextController,
                  onPressed: () => setState(() {
                    _isPasswordVisible1 = !_isPasswordVisible1;
                  }),
                  isPasswordVisible: _isPasswordVisible1,
                  isLogin: false,
                ),
                AppSpacer.vertical.space20,
                RePasswordField(
                  rePasswordTextController: rePasswordTextController,
                  onPressedIcon: () => setState(() {
                    _isPasswordVisible2 = !_isPasswordVisible2;
                  }),
                  isPasswordVisible: _isPasswordVisible2,
                  passwordTextController: passwordTextController,
                ),
                AppSpacer.vertical.space20,
                EmailField(
                  emailTextController: emailTextController,
                  isLogin: false,
                ),
                AppSpacer.vertical.space20,
                _UpdateButton(
                  widget: widget,
                  emailTextController: emailTextController,
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  passwordTextController: passwordTextController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UpdateButton extends StatelessWidget {
  const _UpdateButton({
    required this.widget,
    required this.emailTextController,
    required this.firstNameController,
    required this.lastNameController,
    required this.passwordTextController,
  });

  final EditUserPage widget;
  final TextEditingController emailTextController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: LocaleKeys.settingsPage_update,
      onPressed: () async {
        final userModel = UserModel(
          id: widget.userModel.id,
          email: emailTextController.text,
          devices: widget.userModel.devices,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          password: passwordTextController.text,
        );

        final isEmailExist = await AuthRepository()
            .isEmailExists(eMail: emailTextController.text);

        if (!context.mounted) return;
        if (!EditUserPage._formKey.currentState!.validate()) {
          debugPrint('olmadı');
        } else if (isEmailExist &&
            emailTextController.text != widget.userModel.email) {
          scaffoldMessenger(
            context,
            LocaleKeys.scaffoldMessages_emailCantBeUsed,
          );
        } else {
          scaffoldMessenger(context, LocaleKeys.settingsPage_userUpdated);
          await AuthRepository().updateUser(
            userModel: userModel,
            context: context,
          );
          if (!context.mounted) return;
          await context.router.replace(const LoginRoute());
        }
      },
    );
  }
}
