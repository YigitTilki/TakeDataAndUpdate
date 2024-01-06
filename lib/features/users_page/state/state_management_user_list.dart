// ignore_for_file: unused_result

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';

final userListProvider = FutureProvider<List<UserModel>>((ref) async {
  return AuthRepository().getUsers();
});

final deleteUserProvider =
    FutureProvider.family<void, String>((ref, userId) async {
  await AuthRepository().deleteUser(id: userId);
  ref.refresh(userListProvider);
});
