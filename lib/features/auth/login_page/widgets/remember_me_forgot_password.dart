// ignore_for_file: avoid_positional_boolean_parameters

part of '../login_page.dart';

class _RememberMeForgotPassword extends StatefulWidget {
  const _RememberMeForgotPassword({
    required this.onChanged,
    required this.value,
  });

  final void Function(bool?)? onChanged;
  final bool value;

  @override
  State<_RememberMeForgotPassword> createState() =>
      _RememberMeForgotPasswordState();
}

class _RememberMeForgotPasswordState extends State<_RememberMeForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.symHLarge(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _rememberMe(widget.onChanged, widget.value),
          AppTextButton(
            text: LocaleKeys.loginPage_forgotPassWord,
            onPressed: () {
              context.router.push(const ForgotPasswordRoute());
            },
          ),
        ],
      ),
    );
  }

  Row _rememberMe(void Function(bool?)? onChanged, bool? value) {
    return Row(
      children: [
        Padding(
          padding: ProjectPadding.symHSmall(),
          child: SizedBox(
            width: Checkbox.width.w,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
            ),
          ),
        ),
        const SmallInfoText(text: LocaleKeys.loginPage_rememberMe),
      ],
    );
  }
}
