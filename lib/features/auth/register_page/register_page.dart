import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:take_data_and_update_project/features/auth/register_page/mixin/register_page_mixin.dart';
import 'package:take_data_and_update_project/features/auth/widgets/logo_divider_view.dart';
import 'package:take_data_and_update_project/product/constants/app_colors.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/validators/validators.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';
import 'package:uuid/uuid.dart';

import 'package:take_data_and_update_project/features/auth/widgets/auth_text_form_field.dart';

part 'widgets/already_have_account.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with RegisterPageMixin {
  bool _isPasswordVisible1 = true;
  final bool _isPasswordVisible2 = true;

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
                      obscureText: _isPasswordVisible1,
                      suffixIcon: passwordObscureIcon(
                        context: context,
                        isPasswordVisible: _isPasswordVisible1,
                        onPressed: () => setState(() {
                          _isPasswordVisible1 = !_isPasswordVisible1;
                        }),
                      ),
                      hintText: LocaleKeys.commons_password.tr(),
                      validator: (value) => Validators().password(value: value),
                    ),
                    AppSpacer.vertical.space20,

                    ///RePassword Input Field
                    AuthTextFormField(
                      controller: rePasswordTextController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _isPasswordVisible2,
                      hintText: LocaleKeys.registerPage_rePassword.tr(),
                      suffixIcon: passwordObscureIcon(
                        context: context,
                        isPasswordVisible: _isPasswordVisible2,
                        onPressed: () => setState(() {
                          _isPasswordVisible1 = !_isPasswordVisible1;
                        }),
                      ),
                      validator: (value) => Validators().rePassword(
                        value: value,
                        passwordController: passwordTextController.text,
                      ),
                    ),
                    AppSpacer.vertical.space20,

                    ///Email Input Field
                    AuthTextFormField(
                      controller: emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: LocaleKeys.commons_eMail.tr(),
                      validator: (value) => Validators().eMail(
                        value: value,
                        emailController: emailTextController.text,
                      ),
                    ),
                    AppSpacer.vertical.space20,

                    ///Sign Up Button
                    ElevatedButton(
                      onPressed: () async {
                        final userModel = UserModel(
                          id: const Uuid().v4(),
                          email: emailTextController.text,
                          password: passwordTextController.text,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                        );
                        final emailExists = await AuthRepository()
                            .isEmailExists(eMail: emailTextController.text);
                        if (!context.mounted) return;
                        await buttonProcess(
                          emailExists: emailExists,
                          context: context,
                          userModel: userModel,
                        );
                      },
                      child: Text(
                        LocaleKeys.registerPage_signUpUpperCase,
                        style: context.bodyMedium,
                      ).tr(),
                    ),
                    const _AlreadyHaveAnAccount(),
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
    required bool emailExists,
    required BuildContext context,
    required UserModel userModel,
  }) async {
    if (!RegisterPage._formKey.currentState!.validate()) {
      debugPrint('Olmadı');
    } else if (!emailExists) {
      scaffoldMessenger(context, 'Email Exist');
    } else {
      await AuthRepository().singUpUser(
        userModel: userModel,
        context: context,
      );
    }
  }

  IconButton passwordObscureIcon({
    required BuildContext context,
    required bool isPasswordVisible,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      icon: Icon(
        isPasswordVisible ? Icons.visibility_off : Icons.visibility,
        color: context.primaryColor,
      ),
      onPressed: onPressed,
    );
  }
}
