import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/data/auth/admin_process.dart';
import 'package:take_data_and_update_project/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/init/route/app_router.dart';
import 'package:take_data_and_update_project/util/constants/app_colors.dart';
import 'package:take_data_and_update_project/util/constants/app_spacer.dart';
import 'package:take_data_and_update_project/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/view/auth/register_page/mixin/register_page_mixin.dart';
import 'package:take_data_and_update_project/view/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/view/auth/widgets/logo_divider_view.dart';
import 'package:take_data_and_update_project/view/common/main_container_decoration.dart';

part 'widgets/already_have_account.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with RegisterPageMixin {
  @override
  Widget build(BuildContext context) {
    const int containerWidth = 310;
    const int containerHeight = 580;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: containerWidth.w,
            height: containerHeight.h,
            decoration: containerDecoration(context.secondaryColor),
            child: Form(
              key: RegisterPage._formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ///Logo
                    const LogoDividerView(),
                    AppSpacer.vertical.space20,

                    ///Sign Up UpperCase
                    Text(
                      LocaleKeys.registerPage_signUpUpperCase.tr(),
                      style: context.displayMedium?.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                    AppSpacer.vertical.space20,

                    ///FirstName Input Field
                    AuthTextFormField(
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
                      hintText: LocaleKeys.registerPage_firstName.tr(),
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        } else {
                          return LocaleKeys.validatorErrors_requiredForm.tr();
                        }
                      },
                    ),
                    AppSpacer.vertical.space20,

                    ///LastName Input Field
                    AuthTextFormField(
                      controller: lastNameController,
                      keyboardType: TextInputType.name,
                      hintText: LocaleKeys.registerPage_lastName.tr(),
                      validator: (value) {
                        if (value!.isNotEmpty && value.length >= 2) {
                          return null;
                        } else {
                          return LocaleKeys.validatorErrors_requiredForm.tr();
                        }
                      },
                    ),
                    AppSpacer.vertical.space20,

                    ///Password Input Field
                    AuthTextFormField(
                      controller: passwordTextController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      hintText: LocaleKeys.commons_password.tr(),
                      validator: (value) {
                        if (value!.isNotEmpty && value.length >= 8) {
                          return null;
                        } else {
                          return LocaleKeys.validatorErrors_passwordMust8.tr();
                        }
                      },
                    ),
                    AppSpacer.vertical.space20,

                    ///RePassword Input Field
                    AuthTextFormField(
                      controller: rePasswordTextController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      hintText: LocaleKeys.registerPage_rePassword.tr(),
                      validator: (value) {
                        if (value != passwordTextController.text) {
                          return LocaleKeys.validatorErrors_passwordDoesntMatch
                              .tr();
                        } else {
                          return null;
                        }
                      },
                    ),
                    AppSpacer.vertical.space20,

                    ///Email Input Field
                    AuthTextFormField(
                      controller: emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: LocaleKeys.commons_eMail.tr(),
                      validator: (value) {
                        if (value!.isNotEmpty && value.length > 7) {
                          return null;
                        } else {
                          return LocaleKeys.validatorErrors_invalidEmail.tr();
                        }
                      },
                    ),
                    AppSpacer.vertical.space20,

                    ///Sign Up Button
                    ElevatedButton(
                      onPressed: () {
                        if (!RegisterPage._formKey.currentState!.validate()) {
                          return debugPrint("Olmadı");
                        } else {
                          FirebaseInteractions().signUpAdmin(
                              context,
                              emailTextController.text,
                              passwordTextController.text,
                              "${firstNameController.text}"
                              " "
                              "${lastNameController.text}");
                        }
                      },
                      child: Text(
                        LocaleKeys.registerPage_signUpUpperCase,
                        style: context.bodyMedium,
                      ).tr(),
                    ),
                    const _AlreadyHaveAnAccount()
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
