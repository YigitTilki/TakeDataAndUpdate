part of '../users_page.dart';

class _UsersList extends ConsumerWidget {
  const _UsersList({
    required this.userList,
    required this.searchController,
    required this.iconSize,
  });

  final Future<List<UserModel>> userList;
  final TextEditingController searchController;
  final int iconSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userListProvider);

    return userList.when(
      data: (userListData) {
        final filteredList = userListData.where(filter).toList();
        return _UserList(
          filteredList: filteredList,
          iconSize: iconSize,
          ref: ref,
        );
      },
      loading: () => Assets.lottie.loading.lottie(height: 50.h),
      error: (error, stack) => Text('Error: $error'),
    );
  }

  bool filter(UserModel user) {
    return user.firstName!.toLowerCase().contains(
              searchController.text.toLowerCase(),
            ) ||
        user.lastName!.toLowerCase().contains(
              searchController.text.toLowerCase(),
            );
  }
}

class _UserList extends StatelessWidget {
  const _UserList({
    required this.filteredList,
    required this.iconSize,
    required this.ref,
  });

  final List<UserModel> filteredList;
  final int iconSize;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (BuildContext context, int index) {
          final user = filteredList[index];
          final userModel = UserModel(
            id: user.id,
            firstName: user.firstName,
            lastName: user.lastName,
            email: user.email,
            devices: user.devices,
          );

          return Padding(
            padding: ProjectPadding.symHXXSmall() + ProjectPadding.symVXSmall(),
            child: Container(
              height: 60.h,
              decoration: Decorations.borderContainerDecoration(
                context.fourthColor,
                context.primaryColor,
              ),
              child: Center(
                child: ListTile(
                  onTap: () {
                    show(
                      context,
                      _UserListPopUp(
                        userModel: userModel,
                        ref: ref,
                      ),
                    );
                  },
                  leading: Assets.icons.usersIcon.image(
                    width: iconSize.w,
                    height: iconSize.h,
                    color: context.primaryColor,
                  ),
                  title: Text('${userModel.firstName} ${userModel.lastName}'),
                  subtitle: Text(userModel.email ?? ''),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
