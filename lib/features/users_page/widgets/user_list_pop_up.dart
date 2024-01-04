part of '../users_page.dart';

class _UserListPopUp extends StatelessWidget {
  const _UserListPopUp({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.id,
    required this.ref,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String id;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    const imageSize = 40;
    return AlertDialog(
      title: ListTile(
        leading: Assets.icons.noProfilePhotoIcon
            .image(width: imageSize.w, height: imageSize.h),
        title: Text('$firstName $lastName'),
        subtitle: Text(email),
      ),
      titlePadding: ProjectPadding.allSmall(),
      contentPadding: ProjectPadding.symHXXLarge(),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${LocaleKeys.usersPage_idUpper.tr()} : ',
                style: context.bodyMedium,
              ),
            ),
            AppSpacer.vertical.space5,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                id,
                style: context.titleMedium,
              ),
            ),
            AppSpacer.vertical.space5,
            Divider(
              color: context.fourthColor,
            ),
            AppSpacer.vertical.space5,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${LocaleKeys.usersPage_devices.tr()} :',
                style: context.bodyMedium,
              ),
            ),
            AppSpacer.vertical.space5,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                //TODO: add devices when devices added
                '$id\n$id\n$id\n$id\n$id\n$id\n$id\n$id',
                style: context.titleMedium,
              ),
            ),
            AppSpacer.vertical.space10,
          ],
        ),
      ),
      actions: [
        AppSpacer.horizontal.space10,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              //TODO: is it necessary
              child: ElevatedButton(
                onPressed: () async {
                  await context.router.pop();
                },
                child: Text(
                  LocaleKeys.usersPage_updateUser.tr(),
                  style: context.titleLarge,
                ),
              ),
            ),
            AppSpacer.horizontal.space10,
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  final refresh = ref.refresh(userListProvider);
                  ref.read(deleteUserProvider(id));
                  // ignore: unnecessary_statements
                  refresh;
                  scaffoldMessenger(context, '$firstName $lastName Deleted');
                  await context.router.pop();
                },
                child: Text(
                  LocaleKeys.usersPage_deleteUser.tr(),
                  style: context.titleLarge,
                ),
              ),
            ),
          ],
        ),
      ],
      shape: Decorations.popUpDecoration(context.fourthColor),
    );
  }
}
