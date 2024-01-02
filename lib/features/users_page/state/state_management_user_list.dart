import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/auth/data/auth_repository.dart';
import 'package:take_data_and_update_project/features/auth/domain/user_model.dart';

final userListProvider = FutureProvider<List<UserModel>>((ref) async {
  return AuthRepository().getUsers();
});

final deleteUserProvider =
    FutureProvider.family<void, String>((ref, userId) async {
  await AuthRepository().deleteUser(id: userId);
});
