import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/auth/data/firebase_auth_services.dart';
import 'package:take_data_and_update_project/features/auth/domain/base_auth_repository.dart';
import 'package:take_data_and_update_project/features/auth/domain/user_model.dart';
import 'package:take_data_and_update_project/features/common/scaffold_messengers.dart';
import 'package:take_data_and_update_project/init/route/app_router.dart';

class AuthRepository extends BaseAuthRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  Future<List<Map<String, dynamic>>> getUsers() async {
    QuerySnapshot querySnapshot = await _firestore.collection('users').get();
    List<Map<String, dynamic>> userList = [];

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      userList.add(doc.data() as Map<String, dynamic>);
    }

    return userList;
  }

  @override
  Future<void> loginAdmin(
      {required BuildContext context,
      required String emailController,
      required String passwordController}) async {
    String email = emailController;
    String password = passwordController;

    User? user = await _auth.signIn(email, password);
    if (!context.mounted) return;
    if (user != null) {
      debugPrint("Admin signed in");
      context.router.replace(const AdminRoute());
    } else {
      scaffoldMessenger(context, 'E-Mail or Password Error');
    }
  }

  @override
  Future<void> signUpAdmin(
      {required BuildContext context,
      required String emailController,
      required String passwordController,
      required String displayName}) async {
    String email = emailController;
    String password = passwordController;

    User? user = await _auth.signUp(email, password, displayName);

    if (!context.mounted) return;
    if (user != null) {
      debugPrint("User signed up");

      context.router.replace(const HomeRoute());
    } else {
      scaffoldMessenger(context, 'Some error occurred');
    }
  }

  @override
  Future<void> signInUser(
      {required String emailController,
      required String passwordController,
      required BuildContext context}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
          .instance
          .collection('users')
          .where('E-Mail', isEqualTo: emailController)
          .where('Password', isEqualTo: passwordController)
          .get();

      if (!context.mounted) return;

      if (result.docs.isNotEmpty) {
        context.router.replace(const HomeRoute());
      } else {
        scaffoldMessenger(context, 'E-Mail or Password Error');
      }
    } catch (error) {
      debugPrint('Error during sign-in: $error');
    }
  }

  @override
  Future<void> singUpUser(
      {required UserModel userModel, required BuildContext context}) async {
    try {
      Map<String, dynamic> userMap = userModel.toMap();

      await FirebaseFirestore.instance.collection('users').add(userMap);

      if (!context.mounted) return;
      debugPrint('User Added');
      context.router.replace(const HomeRoute());
    } catch (e) {
      debugPrint('User cant be added: $e');
    }
  }

  @override
  Future<bool> isEmailExists({required String eMail}) async {
    QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: eMail)
        .get();

    if (query.docs.isNotEmpty) return false;
    return true;
  }
}
