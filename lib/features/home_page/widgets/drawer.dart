part of '../home_page.dart';

class _HomePageDrawer extends StatelessWidget {
  final UserModel userModel;
  const _HomePageDrawer(this.userModel);

  @override
  Widget build(BuildContext context) {
    const int profileImageSize = 80;
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
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(ImageHelper.profileIcon),
                    ),
                  ),
                  AppSpacer.vertical.space5,
                  Expanded(
                    child: Text(
                      //TODO: take name
                      "${userModel.firstName} ${userModel.lastName}",
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
