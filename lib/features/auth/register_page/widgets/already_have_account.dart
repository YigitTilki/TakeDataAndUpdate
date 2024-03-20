part of '../register_page.dart';

class _AlreadyHaveAnAccount extends StatelessWidget {
  const _AlreadyHaveAnAccount();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SmallInfoText(
          text: LocaleKeys.registerPage_alreadyHaveAnAcc,
        ),
        AppTextButton(
          text: LocaleKeys.registerPage_logIn,
          onPressed: () {
            context.router.pushAndPopUntil(
              const LoginRoute(),
              predicate: (predicate) => true,
            );
          },
        ),
      ],
    );
  }
}
