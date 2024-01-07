import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/logo_divider_view.dart';
import 'package:take_data_and_update_project/features/settings_page/mixin/edit_user_mixin.dart';
import 'package:take_data_and_update_project/product/constants/app_colors.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/validators/validators.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';

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

  @override
  Widget build(BuildContext context) {
    const containerWidth = 310;
    const containerHeight = 580;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: containerWidth.w,
            height: containerHeight.h,
            decoration: Decorations.containerDecoration(context.secondaryColor),
            child: Form(
              key: EditUserPage._formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ///Logo
                    const LogoDividerView(),
                    AppSpacer.vertical.space20,

                    ///Sign Up UpperCase
                    Text(
                      'Update User',
                      style: context.displaySmall?.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                    AppSpacer.vertical.space20,

                    ///FirstName Input Field
                    AuthTextFormField(
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
                      hintText: LocaleKeys.registerPage_firstName.tr(),
                      validator: (value) =>
                          Validators().firstName(value: value),
                    ),
                    AppSpacer.vertical.space20,

                    ///LastName Input Field
                    AuthTextFormField(
                      controller: lastNameController,
                      keyboardType: TextInputType.name,
                      hintText: LocaleKeys.registerPage_lastName.tr(),
                      validator: (value) => Validators().lastName(value: value),
                    ),
                    AppSpacer.vertical.space20,

                    ///Password Input Field
                    AuthTextFormField(
                      controller: passwordTextController,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: LocaleKeys.commons_password.tr(),
                      validator: (value) => Validators().password(value: value),
                    ),
                    AppSpacer.vertical.space20,

                    ///RePassword Input Field
                    AuthTextFormField(
                      controller: rePasswordTextController,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: LocaleKeys.registerPage_rePassword.tr(),
                      validator: (value) => Validators().rePassword(
                        value: value,
                        passwordController: passwordTextController.text,
                      ),
                    ),
                    AppSpacer.vertical.space20,

                    ///Sign Up Button
                    ElevatedButton(
                      onPressed: () async {
                        final userModel = UserModel(
                          id: widget.userModel.id,
                          email: widget.userModel.email,
                          devices: widget.userModel.devices,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          password: passwordTextController.text,
                        );
                        if (!EditUserPage._formKey.currentState!.validate()) {
                          debugPrint('Olmadısss');
                        } else {
                          await AuthRepository().updateUser(
                            userModel: userModel,
                            context: context,
                          );
                        }
                      },
                      child: Text(
                        'Update',
                        style: context.bodyMedium,
                      ).tr(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
