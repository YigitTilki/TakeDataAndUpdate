part of '../login_page.dart';

class _NotAMemberYet extends StatelessWidget {
  const _NotAMemberYet();

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
