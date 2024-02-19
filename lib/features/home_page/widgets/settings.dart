part of '../home_page.dart';

class _Settings extends StatelessWidget {
  const _Settings({
    required this.userModel,
    required this.mediumContainerWidth,
    required this.smallContainerHeight,
  });

  final UserModel userModel;
  final int mediumContainerWidth;
  final int smallContainerHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: InkWell(
        onTap: () {
          context.router.push(SettingsRoute(userModel: userModel));
        },
        child: HomeContainer(
          width: mediumContainerWidth,
          height: smallContainerHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Assets.icons.settingsIcon.svg(),
              const LargeText(value: LocaleKeys.homePage_settings),
            ],
          ),
        ),
      ),
    );
  }
}
