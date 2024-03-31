part of '../users_page.dart';

class UserListFloatingActionButton extends ConsumerStatefulWidget {
  const UserListFloatingActionButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FloatingActionButtonState();
}

class _FloatingActionButtonState
    extends ConsumerState<UserListFloatingActionButton> with AddUserMixin {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<Widget>(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            ref.watch(userListProvider);
            final passwordVisible1 = ref.watch(passwordVisibilityProvider1);
            final passwordVisible2 = ref.watch(passwordVisibilityProvider2);
            return Form(
              key: formKey,
              child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  decoration: Decorations.borderContainerDecoration(
                    context.secondaryColor,
                    context.primaryColor,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        AppSpacer.vertical.space20,
                        const _BottomSheetHeader(),
                        AppSpacer.vertical.space10,
                        FirstNameField(
                          firstNameController: firstNameController,
                        ),
                        AppSpacer.vertical.space10,
                        LastNameField(
                          lastNameController: lastNameController,
                        ),
                        AppSpacer.vertical.space10,
                        PasswordField(
                          passwordTextController: passwordTextController,
                          onPressed: () => ref
                              .read(passwordVisibilityProvider1.notifier)
                              .state = !passwordVisible1,
                          isPasswordVisible: passwordVisible1,
                          isLogin: false,
                        ),
                        AppSpacer.vertical.space10,
                        RePasswordField(
                          rePasswordTextController: rePasswordTextController,
                          onPressedIcon: () => ref
                              .read(passwordVisibilityProvider2.notifier)
                              .state = !passwordVisible2,
                          isPasswordVisible: passwordVisible2,
                          passwordTextController: passwordTextController,
                        ),
                        AppSpacer.vertical.space10,
                        EmailField(
                          emailTextController: emailTextController,
                          isLogin: false,
                        ),
                        AppSpacer.vertical.space10,
                        Center(
                          child: AppElevatedButton(
                            text: LocaleKeys.usersPage_addUser,
                            onPressed: elevatedButtonProcess,
                          ),
                        ),
                        AppSpacer.vertical.space20,
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

class _BottomSheetHeader extends StatelessWidget {
  const _BottomSheetHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
        icon: Assets.icons.adminUsersIcon.image(),
        text: LocaleKeys.usersPage_addUser,
        needBackButton: false);
  }
}
