import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';

final userListProvider = FutureProvider<List<UserModel>>((ref) async {
  return AuthRepository().getUsers();
});

final deleteUserProvider =
    FutureProvider.family<void, String>((ref, userId) async {
  await AuthRepository().deleteUser(id: userId);
  // ignore: unused_result
  ref.refresh(userListProvider);
});

final userListNotifierProvider =
    StateNotifierProvider<UserListNotifier, AsyncValue<List<UserModel>>>(
  (ref) => UserListNotifier(),
);

class UserListNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  UserListNotifier() : super(const AsyncLoading());

  void filterUsers(String value, List<UserModel> users) {
    state = AsyncData(
      users
          .where(
            (user) =>
                user.firstName!.toLowerCase().contains(value.toLowerCase()) ||
                user.lastName!.toLowerCase().contains(value.toLowerCase()),
          )
          .toList(),
    );
  }
}
