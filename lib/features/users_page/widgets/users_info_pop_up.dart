import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/auth/data/auth_repository.dart';
import 'package:take_data_and_update_project/util/extensions/build_context_extension.dart';

Future<dynamic> usersInfoPopUp(
    BuildContext context, String firstName, String lastName, String id) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "$firstName $lastName",
            textAlign: TextAlign.center,
          ),
          content: ElevatedButton(
            onPressed: () async {
              await AuthRepository().deleteUser(context: context, id: id);
              context.router.pop();
            },
            child: Text(
              "Delete",
              style: context.headlineSmall,
            ),
          ),
        );
      });
}
