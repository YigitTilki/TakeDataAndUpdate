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
      title: _ListTile(
        imageSize: imageSize,
        firstName: firstName,
        lastName: lastName,
        email: email,
      ),
      titlePadding: ProjectPadding.allSmall(),
      contentPadding: ProjectPadding.symHXXLarge(),
      content: _Content(id: id),
      actions: [
        _Buttons(ref: ref, id: id, firstName: firstName, lastName: lastName),
      ],
      shape: Decorations.popUpDecoration(context.fourthColor),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    required this.ref,
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  final WidgetRef ref;
  final String id;
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          //TODO: is it necessary
          child: BorderedElevatedButton(
            onPressed: () {},
            text: LocaleKeys.usersPage_updateUser,
          ),
        ),
        AppSpacer.horizontal.space10,
        Expanded(
          child: BorderedElevatedButton(
            onPressed: () async {
              ref.read(deleteUserProvider(id));
              scaffoldMessenger(
                context,
                '$firstName $lastName ${LocaleKeys.scaffoldMessages_deleted.tr()}',
              );
              await context.router.pop();
            },
            text: LocaleKeys.usersPage_deleteUser,
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.imageSize,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  final int imageSize;
  final String firstName;
  final String lastName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Assets.icons.noProfilePhotoIcon
          .image(width: imageSize.w, height: imageSize.h),
      title: Text('$firstName $lastName'),
      subtitle: Text(email),
    );
  }
}
