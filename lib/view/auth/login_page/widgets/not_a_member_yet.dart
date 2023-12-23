import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/init/route/app_router.dart';
import 'package:take_data_and_update_project/util/constants/app_colors.dart';
import 'package:take_data_and_update_project/util/extensions/build_context_extension.dart';

class NotAMemberYet extends StatelessWidget {
  const NotAMemberYet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.loginPage_notAMemberYet.tr(),
          style: context.titleLarge?.copyWith(color: AppColors.tertiaryColor),
        ),
        TextButton(
          onPressed: () {
            context.router.replace(const RegisterRoute());
          },
          child: Text(
            LocaleKeys.loginPage_signUp.tr(),
            style:
                context.titleLarge?.copyWith(color: AppColors.clickableColor),
          ),
        ),
      ],
    );
  }
}
