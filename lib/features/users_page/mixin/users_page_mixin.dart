import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/users_page/users_page.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/util/wifi_connector.dart';

mixin UsersPageMixin on ConsumerState<UsersPage> {
  late Future<List<UserModel>> _userList;
  final TextEditingController _searchController = TextEditingController();

  TextEditingController get searchController => _searchController;
  Future<List<UserModel>> get userList => _userList;

  @override
  void initState() {
    _userList = AuthRepository().getUsers();
    super.initState();
    wifiConnector(context, ref);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
