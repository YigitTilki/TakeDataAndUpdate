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
    return Consumer(
      builder: (context, ref, child) {
        ref.watch(userListProvider);
        return FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<Widget>(
              context: context,
              builder: (BuildContext context) {
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
                          AuthTextFormField(
                            controller: firstNameController,
                            keyboardType: TextInputType.name,
                            hintText: LocaleKeys.registerPage_firstName.tr(),
                            validator: (value) =>
                                Validators().firstName(value: value),
                          ),
                          AppSpacer.vertical.space10,

                          ///LastName Input Field
                          AuthTextFormField(
                            controller: lastNameController,
                            keyboardType: TextInputType.name,
                            hintText: LocaleKeys.registerPage_lastName.tr(),
                            validator: (value) =>
                                Validators().lastName(value: value),
                          ),
                          AppSpacer.vertical.space10,

                          ///Password Input Field
                          AuthTextFormField(
                            controller: passwordTextController,
                            keyboardType: TextInputType.visiblePassword,
                            hintText: LocaleKeys.commons_password.tr(),
                            validator: (value) =>
                                Validators().password(value: value),
                          ),
                          AppSpacer.vertical.space10,

                          ///RePassword Input Field
                          AuthTextFormField(
                            controller: rePasswordTextController,
                            keyboardType: TextInputType.visiblePassword,
                            hintText: LocaleKeys.registerPage_rePassword.tr(),
                            validator: (value) => Validators().rePassword(
                              value: value,
                              passwordController: passwordTextController.text,
                            ),
                          ),
                          AppSpacer.vertical.space10,

                          ///Email Input Field
                          AuthTextFormField(
                            controller: emailTextController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: LocaleKeys.commons_eMail.tr(),
                            validator: (value) => Validators().eMail(
                              value: value,
                              emailController: emailTextController.text,
                            ),
                          ),
                          AppSpacer.vertical.space10,

                          Center(
                            //TODO: do refactor this page
                            child: AppElevatedButton(
                              text: LocaleKeys.usersPage_addUser,
                              onPressed: () async {
                                final emailExists =
                                    await AuthRepository().isEmailExists(
                                  eMail: emailTextController.text,
                                );
                                if (!context.mounted) return;
                                if (!formKey.currentState!.validate()) {
                                  return debugPrint('Olmadı');
                                } else if (emailExists) {
                                  scaffoldMessenger(context,
                                      LocaleKeys.scaffoldMessages_emailExist);
                                } else {
                                  final userModel = UserModel(
                                    id: const Uuid().v4(),
                                    email: emailTextController.text,
                                    password: passwordTextController.text,
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                  );
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
          child: const Icon(Icons.add),
        );
      },
    );
  }
}
