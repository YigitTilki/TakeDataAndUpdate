import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/core/constants/app_string.dart';
import 'package:take_data_and_update_project/core/route/app_router.dart';
import 'package:take_data_and_update_project/core/util/app_spacer.dart';
import 'package:take_data_and_update_project/core/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/src/features/auth/presentation/auth_text_form_field.dart';
import 'package:take_data_and_update_project/src/features/auth/presentation/logo_divider_view.dart';
import 'package:take_data_and_update_project/src/features/common/main_container_decoration.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                    const LogoDividerView(),
                    AppSpacer.vertical.space20,
                    Text(
                      AppString.signUpUpperCase,
                      style: context.headLineLarge,
                    ),
                    AppSpacer.vertical.space20,
                    //TODO: FirstName validate and controller config
                    AuthTextFormField(
                      hintText: AppString.firstName,
                      validator: (value) {
                        if (value!.isNotEmpty && value.length > 5) {
                          return null;
                        } else {
                          return "Too short";
                        }
                      },
                    ),
                    AppSpacer.vertical.space20,
                    //TODO: LastName validate and controller config
                    AuthTextFormField(
                      hintText: AppString.lastName,
                      validator: (value) {
                        if (value!.isNotEmpty && value.length > 5) {
                          return null;
                        } else {
                          return "Too short";
                        }
                      },
                    ),
                    AppSpacer.vertical.space20,
                    //TODO: Password validate and controller config
                    AuthTextFormField(
                      hintText: AppString.password,
                      validator: (value) {
                        if (value!.isNotEmpty && value.length > 5) {
                          return null;
                        } else {
                          return "Too short";
                        }
                      },
                    ),
                    AppSpacer.vertical.space20,
                    //TODO: RePassword validate and controller config
                    AuthTextFormField(
                      hintText: AppString.rePassword,
                      validator: (value) {
                        if (value!.isNotEmpty && value.length > 5) {
                          return null;
                        } else {
                          return "Too short";
                        }
                      },
                    ),
                    AppSpacer.vertical.space20,
                    //TODO: Email / PhoneNumber validate and controller config
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
                    ElevatedButton(
                      onPressed: () {
                        if (!RegisterPage._formKey.currentState!.validate()) {
                          return debugPrint("Olmadı");
                        }
                      },
                      child: const Text(
                        AppString.signUpUpperCase,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppString.alreadyHaveAnAcc,
                          style: context.labelSmall,
                        ),
                        TextButton(
                          onPressed: () {
                            context.router.replace(const LoginRoute());
                          },
                          child: Text(
                            AppString.logIn,
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
      ),
    );
  }
}
