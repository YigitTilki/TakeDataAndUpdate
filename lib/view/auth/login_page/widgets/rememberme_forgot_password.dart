import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/init/route/app_router.dart';
import 'package:take_data_and_update_project/util/constants/app_colors.dart';
import 'package:take_data_and_update_project/util/constants/app_spacer.dart';
import 'package:take_data_and_update_project/util/constants/project_padding.dart';
import 'package:take_data_and_update_project/util/extensions/build_context_extension.dart';

class RememberMeForgotPassword extends StatefulWidget {
  const RememberMeForgotPassword({super.key});

  @override
  State<RememberMeForgotPassword> createState() =>
      _RememberMeForgotPasswordState();
}

class _RememberMeForgotPasswordState extends State<RememberMeForgotPassword> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.symHLarge(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: Checkbox.width.w,
                //TODO: CheckBox func
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
                LocaleKeys.loginPage_rememberMe.tr(),
                style: context.titleLarge
                    ?.copyWith(color: AppColors.tertiaryColor),
              )
            ],
          ),
          TextButton(
            onPressed: () {
              //TODO: Forgot Password Route
              context.router.replace(
                const HomeRoute(),
              );
            },
            child: Text(
              LocaleKeys.loginPage_forgotPassWord.tr(),
              style:
                  context.titleLarge?.copyWith(color: AppColors.tertiaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
