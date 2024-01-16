// ignore_for_file: unused_result

part of '../users_page.dart';

class UserListFloatingActionButton extends StatefulWidget {
  const UserListFloatingActionButton({super.key});

  @override
  State<UserListFloatingActionButton> createState() =>
      _FloatingActionButtonState();
}

class _FloatingActionButtonState extends State<UserListFloatingActionButton>
    with AddUserMixin {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<Widget>(
          context: context,
          builder: (BuildContext context) {
            return Consumer(
              builder: (context, ref, child) {
                ref.watch(userListProvider);
                final passwordVisible1 = ref.watch(passwordVisibilityProvider1);
                final passwordVisible2 = ref.watch(passwordVisibilityProvider2);
                return Form(
                  key: formKey,
                  child: Container(
                    decoration: Decorations.borderContainerDecoration(
                      context.secondaryColor,
                      context.primaryColor,
                    ),
                    height: double.infinity,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AppSpacer.vertical.space30,
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
                              onPressed: () async {
                                final emailExists =
                                    await AuthRepository().isEmailExists(
                                  eMail: emailTextController.text,
                                );
                                final userModel = UserModel(
                                  id: const Uuid().v4(),
                                  email: emailTextController.text,
                                  password: passwordTextController.text,
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                );

                                await _buttonOnPressed(
                                  emailExists,
                                  context,
                                  userModel,
                                  ref,
                                );
                              },
                            ),
                          ),
                          AppSpacer.vertical.space10,
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }

  Future<void> _buttonOnPressed(
    bool emailExists,
    BuildContext context,
    UserModel userModel,
    WidgetRef ref,
  ) async {
    if (!formKey.currentState!.validate()) {
      debugPrint('Olmadı');
    } else if (emailExists) {
      scaffoldMessenger(
        context,
        LocaleKeys.scaffoldMessages_emailExist,
      );
    } else {
      await AuthRepository().singUpUser(
        userModel: userModel,
        context: context,
      );
      await ref.refresh(userListProvider.future);
      clearController();
      scaffoldMessenger(
        context,
        LocaleKeys.scaffoldMessages_userAdded,
      );
      await context.router.pop();
    }
  }
}
