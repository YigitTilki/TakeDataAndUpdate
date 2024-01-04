part of '../home_page.dart';

class _HomePageDrawer extends StatelessWidget {
  const _HomePageDrawer(this.userModel);
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    const profileImageSize = 80;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: profileImageSize.h,
                    width: profileImageSize.w,
                    child: Assets.icons.noProfilePhotoIcon.image(),
                  ),
                  AppSpacer.vertical.space5,
                  Expanded(
                    child: Text(
                      '${userModel.firstName} ${userModel.lastName}',
                      overflow: TextOverflow.ellipsis,
                      style: context.headlineLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
