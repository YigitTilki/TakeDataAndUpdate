import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/auth/data/auth_repository.dart';
import 'package:take_data_and_update_project/features/auth/domain/user_model.dart';

/* final userListProvider =
    StateNotifierProvider<UserListNotifier, List<UserModel>>(
        (ref) => UserListNotifier());

class UserListNotifier extends StateNotifier<List<UserModel>> {
  UserListNotifier() : super([]);

  void delete(UserModel userModel) {
    state = [...state].where((element) => element.id != userModel.id).toList();
  }
} */
final userListProvider = FutureProvider<List<UserModel>>((ref) async {
  // Fetch the initial list of users
  return AuthRepository().getUsers();
});
