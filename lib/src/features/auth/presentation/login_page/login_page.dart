import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/core/constants/app_string.dart';
import 'package:take_data_and_update_project/core/util/app_padding.dart';
import 'package:take_data_and_update_project/core/util/app_spacer.dart';
import 'package:take_data_and_update_project/core/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/src/features/auth/presentation/auth_text_form_field.dart';
import 'package:take_data_and_update_project/src/features/auth/presentation/logo_divider_view.dart';
import 'package:take_data_and_update_project/src/features/common/main_container_decoration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool value = false;

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
                    AppString.login,
                    style: context.headLineLarge,
                  ),
                  AppSpacer.vertical.space20,
                  AuthTextFormField(
                    hintText: AppString.emailPhonenumber,
                    validator: (value) {
                      if (value!.isNotEmpty && value.length > 5) {
                        return null;
                      } else {
                        return "Too short";
                      }
                    },
                  ),
                  AppSpacer.vertical.space20,
                  AuthTextFormField(
                      hintText: AppString.password,
                      validator: (value) {
                        if (value!.isNotEmpty && value.length > 5) {
                          return null;
                        } else {
                          return "Too short";
                        }
                      }),
                  AppSpacer.vertical.space20,
                  ElevatedButton(
                    onPressed: () {
                      if (!LoginPage._formKey.currentState!.validate()) {
                        return debugPrint("Olmadı");
                      }
                    },
                    child: const Text(
                      AppString.login,
                    ),
                  ),
                  AppSpacer.vertical.space10,
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.horizontal.largePadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Checkbox.width.w,
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
                              AppString.rememberMe,
                              style: context.labelSmall,
                            )
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            //TODO: Forgot Password Route
                          },
                          child: Text(
                            AppString.forgotPassWord,
                            style: context.clickableLabelSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.notAMemberYet,
                        style: context.labelSmall,
                      ),
                      TextButton(
                        onPressed: () {
                          //TODO: Sign Up route
                        },
                        child: Text(
                          AppString.singUp,
                          style: context.clickableLabelSmall,
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
