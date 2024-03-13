import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/auth/register_page/mixin/verify_email_page_mixin.dart';
import 'package:take_data_and_update_project/features/auth/widgets/auth_text_form_field.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/buttons/bordered_elevated_button.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';
import 'package:take_data_and_update_project/product/widgets/pop_scope.dart';

@RoutePage()
class VerifyEmailPage extends ConsumerStatefulWidget {
  const VerifyEmailPage({
    required this.code,
    required this.userModel,
    super.key,
  });
  final int code;
  final UserModel userModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EnterCodePageState();
}

class _EnterCodePageState extends ConsumerState<VerifyEmailPage>
    with VerifyEmailMixin {
  @override
  Widget build(BuildContext context) {
    return GoLoginPopScope(
      child: Scaffold(
        backgroundColor: context.secondaryColor,
        body: SafeArea(
          child: Column(
            children: [
              const _Header(),
              AppSpacer.vertical.space20,
              _FormField(codeController: codeController),
              AppSpacer.vertical.space10,
              BorderedElevatedButton(
                onPressed: elevatedButtonProcess,
                text: LocaleKeys.forgotPassword_confirm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({
    required this.codeController,
  });

  final TextEditingController codeController;

  @override
  Widget build(BuildContext context) {
    return AuthTextFormField(
      hintText: LocaleKeys.forgotPassword_enterCode,
      validator: (validator) {
        return null;
      },
      controller: codeController,
      keyboardType: TextInputType.number,
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      icon: Assets.icons.usersIcon.image(),
      text: 'Verify Your Email',
      needBackButton: false,
    );
  }
}
