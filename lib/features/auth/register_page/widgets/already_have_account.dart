part of '../register_page.dart';

class _AlreadyHaveAnAccount extends StatelessWidget {
  const _AlreadyHaveAnAccount();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.registerPage_alreadyHaveAnAcc,
          style: context.titleLarge?.copyWith(color: context.tertiaryColor),
        ).tr(),
        TextButton(
          onPressed: () {
            context.router.replace(
              const LoginRoute(),
            );
          },
          child: Text(
            LocaleKeys.registerPage_logIn,
            style: context.titleLarge?.copyWith(color: context.clickableColor),
          ).tr(),
        ),
      ],
    );
  }
}
