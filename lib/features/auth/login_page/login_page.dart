import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/auth/login_page/mixin/login_page_mixin.dart';
import 'package:take_data_and_update_project/features/auth/widgets/email_field.dart';
import 'package:take_data_and_update_project/features/auth/widgets/logo_divider_view.dart';
import 'package:take_data_and_update_project/features/auth/widgets/password_field.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/text_button.dart';
import 'package:take_data_and_update_project/product/widgets/text/header_text.dart';
import 'package:take_data_and_update_project/product/widgets/text/small_info_text.dart';

part 'widgets/not_a_member_yet.dart';
part 'widgets/remember_me_forgot_password.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> with LoginPageMixin {
  bool _isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.secondaryColor,
      body: SafeArea(
        child: Form(
          key: LoginPage._formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoDividerView(),
                AppSpacer.vertical.space100,
                const HeaderText(value: LocaleKeys.commons_loginUpperCase),
                AppSpacer.vertical.space20,
                EmailField(
                  emailTextController: emailTextController,
                  isLogin: true,
                ),
                AppSpacer.vertical.space20,
                PasswordField(
                  passwordTextController: passwordTextController,
                  onPressed: () => setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  }),
                  isPasswordVisible: _isPasswordVisible,
                  isLogin: true,
                ),
                AppSpacer.vertical.space20,
                _LoginButton(
                  emailTextController: emailTextController,
                  passwordTextController: passwordTextController,
                ),
                AppSpacer.vertical.space10,
                const _RememberMeForgotPassword(),
                const _NotAMemberYet(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.emailTextController,
    required this.passwordTextController,
  });

  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: LocaleKeys.commons_loginUpperCase,
      onPressed: () async {
        final user = UserModel(
          email: emailTextController.text,
          password: passwordTextController.text,
        );
        final isAdmin =
            await AuthRepository().isAdmin(password: user.password!);
        if (!context.mounted) return;

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
      },
    );
  }
}
