import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:take_data_and_update_project/features/auth/presentation/pages/set_own_password_page.dart/mixin/set_own_password_mixin.dart';
import 'package:take_data_and_update_project/features/auth/presentation/pages/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/features/auth/presentation/pages/widgets/logo_divider_view.dart';
import 'package:take_data_and_update_project/product/constants/app_colors.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/validators/validators.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';

@RoutePage()
class SetOwnPasswordPage extends StatefulWidget {
  const SetOwnPasswordPage({required this.userModel, super.key});
  final UserModel userModel;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<SetOwnPasswordPage> createState() => _SetOwnPasswordPageState();
}

class _SetOwnPasswordPageState extends State<SetOwnPasswordPage>
    with SetOwnPasswordMixin {
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
              key: SetOwnPasswordPage._formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const LogoDividerView(),
                    AppSpacer.vertical.space100,

                    ///Set Your Password
                    Text(
                      'Set Your Password',
                      style: context.displayMedium?.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                    AppSpacer.vertical.space20,
                    AuthTextFormField(
                      hintText: LocaleKeys.commons_password.tr(),
                      validator: (value) => Validators().password(value: value),
                      controller: passwordTextController,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    AppSpacer.vertical.space20,
                    AuthTextFormField(
                      hintText: LocaleKeys.registerPage_rePassword.tr(),
                      validator: (value) => Validators().rePassword(
                        value: value,
                        passwordController: passwordTextController.text,
                      ),
                      controller: rePasswordTextController,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (!SetOwnPasswordPage._formKey.currentState!
                            .validate()) {
                          return Logger().d('Olmadı');
                        } else {
                          final userModel = widget.userModel.copyWith(
                              password: passwordTextController
                                  .text); /* UserModel(
                            email: widget.userModel.email,
                            password: passwordTextController.text,
                          ); */
                          await AuthRepository().signUpAuthUser(
                            context: context,
                            userModel: userModel,
                          );
                        }
                      },
                      child: const Text('Confirm Password'),
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
