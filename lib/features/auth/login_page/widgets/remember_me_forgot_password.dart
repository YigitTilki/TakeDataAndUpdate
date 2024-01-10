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
          _rememberMe(),
          AppTextButton(
            text: LocaleKeys.loginPage_forgotPassWord,
            onPressed: () {
              context.router.push(HomeRoute(userModel: UserModel()));
            },
          ),
        ],
      ),
    );
  }

  Row _rememberMe() {
    return Row(
      children: [
        Padding(
          padding: ProjectPadding.symHSmall(),
          child: SizedBox(
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
        ),
        const SmallInfoText(text: LocaleKeys.loginPage_rememberMe),
      ],
    );
  }
}
