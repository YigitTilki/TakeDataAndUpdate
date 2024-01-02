import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/auth/domain/base_auth_repository.dart';
import 'package:take_data_and_update_project/features/auth/domain/user_model.dart';
import 'package:take_data_and_update_project/features/common/scaffold_messengers.dart';
import 'package:take_data_and_update_project/init/route/app_router.dart';

class AuthRepository extends BaseAuthRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  Future<List<UserModel>> getUsers() async {
    QuerySnapshot querySnapshot = await _firestore.collection('users').get();
    List<UserModel> userList = [];

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      UserModel user = UserModel.fromJson(doc.data() as Map<String, dynamic>);
      userList.add(user);
    }

    return userList;
  }

  @override
  Future<void> loginAdmin({
    required BuildContext context,
    required UserModel userModel,
  }) async {
    User? user = await _auth.signIn(
      userModel.email.toString(),
      userModel.password.toString(),
    );
    if (!context.mounted) return;
    if (user != null) {
      debugPrint("Admin signed in");
      context.router.replace(const AdminRoute());
    } else {
      debugPrint("Admin info is wrong");
    }
  }

  @override
  Future<void> signUpAdmin({
    required BuildContext context,
    required UserModel userModel,
  }) async {
    User? user = await _auth.signUp(
        userModel.email.toString(), userModel.password.toString());

    if (!context.mounted) return;
    if (user != null) {
      debugPrint("User signed up");

      context.router.replace(const AdminRoute());
    } else {
      scaffoldMessenger(context, 'Some error occurred');
    }
  }

  @override
  Future<void> signInUser(
      {required UserModel userModel, required BuildContext context}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> result = await _firestore
          .collection('users')
          .where('email', isEqualTo: userModel.email)
          .where('password', isEqualTo: userModel.password)
          .get();

      if (!context.mounted) return;

      if (result.docs.isNotEmpty) {
        String firstName = result.docs.first['firstName'];
        String lastName = result.docs.first['lastName'];

        userModel =
            userModel.copyWith(firstName: firstName, lastName: lastName);

        context.router.replace(HomeRoute(userModel: userModel));
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
      QuerySnapshot<Map<String, dynamic>> passwordFetch = await _firestore
          .collection('passwords')
          .where('password', isEqualTo: userModel.password)
          .get();

      if (passwordFetch.docs.isNotEmpty) {
        await _firestore.collection('users').doc(userModel.id).set(userMap);

        if (!context.mounted) return;
        debugPrint('User Added');

        //context.router.replace(HomeRoute(userModel: userModel));
      } else {
        if (!context.mounted) return;
        scaffoldMessenger(context, "There isn't fetch passwords");
      }
    } catch (e) {
      debugPrint('User cant be added: $e');
    }
  }

  @override
  Future<bool> isEmailExists({required String eMail}) async {
    QuerySnapshot<Map<String, dynamic>> query = await _firestore
        .collection('users')
        .where('email', isEqualTo: eMail)
        .get();

    if (query.docs.isNotEmpty) return false;
    return true;
  }

  @override
  Future<void> deleteUser({required String id}) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      debugPrint("Admin Some error occurred");
    }
    return null;
  }

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } catch (e) {
      debugPrint("Admin Some error occurred");
    }
    return null;
  }
}
