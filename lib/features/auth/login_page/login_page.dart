import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/auth/login_page/mixin/login_page_mixin.dart';
import 'package:take_data_and_update_project/features/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/logo_divider_view.dart';
import 'package:take_data_and_update_project/product/constants/app_colors.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/validators/validators.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';

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
  bool _isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    const containerWidth = 310;
    const containerHeight = 580;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Container(
            width: containerWidth.w,
            height: containerHeight.h,
            decoration: Decorations.containerDecoration(context.secondaryColor),
            child: Form(
              key: LoginPage._formKey,
              child: SingleChildScrollView(
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
                      validator: (value) => Validators().loginEMail(
                        value: value,
                        emailController: emailTextController.text,
                      ),
                    ),
                    AppSpacer.vertical.space20,

                    ///Password Input Field
                    AuthTextFormField(
                      hintText: LocaleKeys.commons_password.tr(),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _isPasswordVisible,
                      suffixIcon: passwordObscureIcon(context),
                      controller: passwordTextController,
                      validator: (value) => Validators().loginPassword(
                        value: value,
                      ),
                    ),
                    AppSpacer.vertical.space20,

                    ///Login Button
                    ElevatedButton(
                      onPressed: () async {
                        final user = UserModel(
                          email: emailTextController.text,
                          password: passwordTextController.text,
                        );
                        final isAdmin = await AuthRepository()
                            .isAdmin(password: user.password!);
                        if (!context.mounted) return;
                        await buttonProcess(
                          isAdmin: isAdmin,
                          context: context,
                          user: user,
                        );
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
      ),
    );
  }

  Future<void> buttonProcess({
    required bool isAdmin,
    required BuildContext context,
    required UserModel user,
  }) async {
    if (isAdmin) {
      await context.router.replace(const AdminRoute());
    } else if (!LoginPage._formKey.currentState!.validate()) {
      debugPrint('Olmadı');
    } else {
      await AuthRepository().signInUser(
        userModel: user,
        context: context,
      );
    }
  }

  IconButton passwordObscureIcon(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
        color: context.primaryColor,
      ),
      onPressed: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      },
    );
  }
}
