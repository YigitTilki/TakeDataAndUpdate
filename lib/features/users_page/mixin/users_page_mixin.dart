import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/auth/data/auth_repository.dart';
import 'package:take_data_and_update_project/features/auth/domain/user_model.dart';
import 'package:take_data_and_update_project/features/users_page/users_page.dart';

mixin UsersPageMixin on State<UsersPage> {
  late Future<List<UserModel>> _userList;
  final TextEditingController _searchController = TextEditingController();

  TextEditingController get searchController => _searchController;
  Future<List<UserModel>> get userList => _userList;

  set userListSetter(Future<List<UserModel>> value) {
    setState(() {
      _userList = value;
    });
  }

  @override
  void initState() {
    _userList = AuthRepository().getUsers();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
