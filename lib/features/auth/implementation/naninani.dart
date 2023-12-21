import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/auth/implementation/firebase_auth_services.dart';
import 'package:take_data_and_update_project/features/common/scaffold_messangers.dart';
import 'package:take_data_and_update_project/init/route/app_router.dart';

class FirebaseInteractions {
  final FirebaseAuthService _auth = FirebaseAuthService();

  void loginAdmin(BuildContext context, String emailController,
      String passwordController) async {
    String email = emailController;
    String password = passwordController;

    User? user = await _auth.signIn(email, password);
    if (!context.mounted) return;
    if (user != null) {
      debugPrint("User signed in");
      context.router.replace(const AdminRoute());
    } else {
      scaffoldMessanger(context, 'E-Mail or Password Error');
    }
  }

  void signUpAdmin(BuildContext context, String emailController,
      String passwordController, String displayName) async {
    String email = emailController;
    String password = passwordController;

    User? user = await _auth.signUp(email, password, displayName);

    if (!context.mounted) return;
    if (user != null) {
      debugPrint("User signed up");

      context.router.replace(HomeRoute(displayName: displayName));
    } else {
      scaffoldMessanger(context, 'Some error occured');
    }
  }
}
