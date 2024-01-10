import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/auth/register_page/mixin/register_page_mixin.dart';
import 'package:take_data_and_update_project/features/auth/widgets/email_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/first_name_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/last_name_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/logo_divider_view.dart';
import 'package:take_data_and_update_project/features/auth/widgets/password_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/re_password_field.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/text_button.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';
import 'package:take_data_and_update_project/product/widgets/text/header_text.dart';
import 'package:take_data_and_update_project/product/widgets/text/small_info_text.dart';
import 'package:uuid/uuid.dart';

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
  bool _isPasswordVisible2 = true;

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
                    const LogoDividerView(),
                    AppSpacer.vertical.space20,
                    const HeaderText(
                      value: LocaleKeys.registerPage_signUpUpperCase,
                    ),
                    AppSpacer.vertical.space20,
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
                      isPasswordVisible: _isPasswordVisible2,
                      passwordTextController: passwordTextController,
                      onPressedIcon: () => setState(() {
                        _isPasswordVisible2 = !_isPasswordVisible2;
                      }),
                    ),
                    AppSpacer.vertical.space20,
                    EmailField(
                      //TODO: tolowerCase indirge
                      emailTextController: emailTextController,
                      isLogin: false,
                    ),
                    AppSpacer.vertical.space20,
                    _RegisterButton(
                      emailTextController: emailTextController,
                      passwordTextController: passwordTextController,
                      firstNameController: firstNameController,
                      lastNameController: lastNameController,
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
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({
    required this.emailTextController,
    required this.passwordTextController,
    required this.firstNameController,
    required this.lastNameController,
  });

  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: LocaleKeys.registerPage_signUpUpperCase,
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
        if (!RegisterPage._formKey.currentState!.validate()) {
          debugPrint('Olmadı');
        } else if (emailExists) {
          scaffoldMessenger(context, 'Email Exist');
        } else {
          await AuthRepository().singUpUser(
            userModel: userModel,
            context: context,
          );
        }
      },
    );
  }
}
