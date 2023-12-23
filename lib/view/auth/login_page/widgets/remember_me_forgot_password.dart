part of '../login_page.dart';

class _RememberMeForgotPassword extends StatefulWidget {
  const _RememberMeForgotPassword();

  @override
  State<_RememberMeForgotPassword> createState() =>
      _RememberMeForgotPasswordState();
}

class _RememberMeForgotPasswordState extends State<_RememberMeForgotPassword> {
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
