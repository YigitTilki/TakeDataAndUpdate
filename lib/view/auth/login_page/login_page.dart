import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/data/auth/admin_process.dart';
import 'package:take_data_and_update_project/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/init/route/app_router.dart';
import 'package:take_data_and_update_project/util/constants/app_colors.dart';
import 'package:take_data_and_update_project/util/constants/app_spacer.dart';
import 'package:take_data_and_update_project/util/constants/project_padding.dart';
import 'package:take_data_and_update_project/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/view/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/view/auth/widgets/logo_divider_view.dart';
import 'package:take_data_and_update_project/view/common/main_container_decoration.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool value = false;
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const int containerWidth = 310;
    const int containerHeight = 580;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Container(
            width: containerWidth.w,
            height: containerHeight.h,
            decoration: containerDecoration(context.secondaryColor),
            child: Form(
              key: LoginPage._formKey,
              child: Column(
                children: [
                  const LogoDividerView(),
                  AppSpacer.vertical.space100,
                  Text(
                    LocaleKeys.commons_loginUpperCase.tr(),
                    style: context.displayMedium
                        ?.copyWith(color: AppColors.blackColor),
                  ),
                  AppSpacer.vertical.space20,
                  AuthTextFormField(
                    hintText: LocaleKeys.commons_eMail.tr(),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailTextController,
                    validator: (value) {
                      if (value!.isNotEmpty && value.length > 7) {
                        return null;
                      } else {
                        return LocaleKeys.validatorErrors_invalidEmailPassword
                            .tr();
                      }
                    },
                  ),
                  AppSpacer.vertical.space20,
                  AuthTextFormField(
                      hintText: LocaleKeys.commons_password.tr(),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: _passwordTextController,
                      validator: (value) {
                        if (value!.isNotEmpty && value.length >= 8) {
                          return null;
                        } else {
                          return LocaleKeys.validatorErrors_invalidEmailPassword
                              .tr();
                        }
                      }),
                  AppSpacer.vertical.space20,
                  ElevatedButton(
                    onPressed: () {
                      if (!LoginPage._formKey.currentState!.validate()) {
                        return debugPrint("Olmadı");
                      } else {
                        FirebaseInteractions().loginAdmin(
                          context,
                          _emailTextController.text,
                          _passwordTextController.text,
                        );
                      }
                      setState(() {});
                    },
                    child: Text(
                      LocaleKeys.commons_loginUpperCase.tr(),
                      style: context.bodyMedium,
                    ),
                  ),
                  AppSpacer.vertical.space10,
                  Padding(
                    padding: ProjectPadding.symHLarge(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Checkbox.width.w,
                              //TODO: CheckBox func
                              child: Checkbox(
                                value: value,
                                onChanged: (bool? value) {
                                  setState(
                                    () {
                                      this.value = value!;
                                    },
                                  );
                                },
                              ),
                            ),
                            AppSpacer.horizontal.space5,
                            Text(
                              LocaleKeys.loginPage_rememberMe.tr(),
                              style: context.titleLarge
                                  ?.copyWith(color: AppColors.tertiaryColor),
                            )
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            //TODO: Forgot Password Route
                            context.router.replace(
                              HomeRoute(displayName: "displayName"),
                            );
                          },
                          child: Text(
                            LocaleKeys.loginPage_forgotPassWord.tr(),
                            style: context.titleLarge
                                ?.copyWith(color: AppColors.tertiaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.loginPage_notAMemberYet.tr(),
                        style: context.titleLarge
                            ?.copyWith(color: AppColors.tertiaryColor),
                      ),
                      TextButton(
                        onPressed: () {
                          context.router.replace(const RegisterRoute());
                        },
                        child: Text(
                          LocaleKeys.loginPage_signUp.tr(),
                          style: context.titleLarge
                              ?.copyWith(color: AppColors.clickableColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
