import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/users_page/users_page.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/providers/user_providers.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/util/wifi_connector.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';
import 'package:uuid/uuid.dart';

mixin AddUserMixin on ConsumerState<UserListFloatingActionButton> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final rePasswordTextController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    wifiConnector(context, ref);
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    rePasswordTextController.dispose();
    super.dispose();
  }

  void clearController() {
    emailTextController.clear();
    passwordTextController.clear();
    firstNameController.clear();
    lastNameController.clear();
    rePasswordTextController.clear();
  }

  Future<void> elevatedButtonProcess() async {
    final emailExists = await AuthRepository().isEmailExists(
      eMail: emailTextController.text.toLowerCase(),
    );
    final userModel = UserModel(
      id: const Uuid().v4(),
      email: emailTextController.text.toLowerCase(),
      password: passwordTextController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
    );

    if (!formKey.currentState!.validate()) {
      debugPrint('Olmadı');
    } else if (emailExists) {
      if (!context.mounted) return;

      scaffoldMessenger(
        context,
        LocaleKeys.scaffoldMessages_emailExist,
      );
    } else {
      if (!context.mounted) return;

      await AuthRepository().singUpUser(
        userModel: userModel,
        context: context,
      );
      ref.invalidate(userListProvider);
      clearController();
      if (!context.mounted) return;

      scaffoldMessenger(
        context,
        LocaleKeys.scaffoldMessages_userAdded,
      );
      await context.router.pop();
    }
  }
}
