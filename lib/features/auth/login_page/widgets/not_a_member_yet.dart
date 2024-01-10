part of '../login_page.dart';

class _NotAMemberYet extends StatelessWidget {
  const _NotAMemberYet();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SmallInfoText(text: LocaleKeys.loginPage_notAMemberYet),
        AppTextButton(
          text: LocaleKeys.loginPage_signUp,
          onPressed: () {
            context.router.replace(const RegisterRoute());
          },
        ),
      ],
    );
  }
}
