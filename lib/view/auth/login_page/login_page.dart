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
import 'package:take_data_and_update_project/view/auth/login_page/mixin/login_page_mixin.dart';
import 'package:take_data_and_update_project/view/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/view/auth/widgets/logo_divider_view.dart';
import 'package:take_data_and_update_project/view/common/main_container_decoration.dart';

part 'widgets/not_a_member_yet.dart';
part 'widgets/remember_me_forgot_password.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginPageMixin {
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
                  ///Logo
                  const LogoDividerView(),
                  AppSpacer.vertical.space100,

                  ///Login UpperCase
                  Text(
                    LocaleKeys.commons_loginUpperCase.tr(),
                    style: context.displayMedium
                        ?.copyWith(color: AppColors.blackColor),
                  ),
                  AppSpacer.vertical.space20,

                  ///Email Input Field
                  AuthTextFormField(
                    hintText: LocaleKeys.commons_eMail.tr(),
                    keyboardType: TextInputType.emailAddress,
                    controller: emailTextController,
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

                  ///Password Input Field
                  AuthTextFormField(
                    hintText: LocaleKeys.commons_password.tr(),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: passwordTextController,
                    validator: (value) {
                      if (value!.isNotEmpty && value.length >= 8) {
                        return null;
                      } else {
                        return LocaleKeys.validatorErrors_invalidEmailPassword
                            .tr();
                      }
                    },
                  ),
                  AppSpacer.vertical.space20,

                  ///Login Button
                  ElevatedButton(
                    onPressed: () {
                      if (!LoginPage._formKey.currentState!.validate()) {
                        return debugPrint("Olmadı");
                      } else {
                        FirebaseInteractions().loginAdmin(
                          context,
                          emailTextController.text,
                          passwordTextController.text,
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

                  ///Remember Me and Forgot Password
                  const _RememberMeForgotPassword(),

                  ///Not a Member Yet
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
