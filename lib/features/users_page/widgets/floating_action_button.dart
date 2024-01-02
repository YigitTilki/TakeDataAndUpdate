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
            showDialog<Widget>(
              context: context,
              builder: (BuildContext context) {
                return Form(
                  key: formKey,
                  child: Center(
                    child: AlertDialog(
                      title: Center(
                        child: Text(
                          'Add User',
                          style: context.headlineMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      contentPadding: ProjectPadding.allXSmall(),
                      titlePadding: ProjectPadding.symVNormal(),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
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
                              child: ElevatedButton(
                                onPressed: () async {
                                  final emailExists =
                                      await AuthRepository().isEmailExists(
                                    eMail: emailTextController.text,
                                  );
                                  if (!context.mounted) return;
                                  if (!formKey.currentState!.validate()) {
                                    return debugPrint('Olmadı');
                                  } else if (!emailExists) {
                                    scaffoldMessenger(context, 'Email Exist');
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
                                    if (!context.mounted) return;
                                    clearController();
                                    await context.router.pop();
                                  }
                                },
                                child: Text(
                                  LocaleKeys.registerPage_signUpUpperCase,
                                  style: context.bodyMedium,
                                ).tr(),
                              ),
                            ),
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
      },
    );
  }
}
