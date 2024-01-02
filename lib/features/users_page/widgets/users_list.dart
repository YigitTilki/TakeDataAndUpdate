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
        final filteredList = userListData
            .where(
              (user) =>
                  user.firstName!.toLowerCase().contains(
                        searchController.text.toLowerCase(),
                      ) ||
                  user.lastName!.toLowerCase().contains(
                        searchController.text.toLowerCase(),
                      ),
            )
            .toList();
        return Expanded(
          child: ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (BuildContext context, int index) {
              final user = filteredList[index];

              final firstName = user.firstName!;
              final lastName = user.lastName!;
              final email = user.email!;
              final id = user.id!;

              return Padding(
                padding:
                    ProjectPadding.symHXXSmall() + ProjectPadding.symVXSmall(),
                child: Container(
                  height: 60.h,
                  decoration: ShapeDecoration(
                    color: context.fourthColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.sp),
                      side:
                          BorderSide(color: context.primaryColor, width: 2.sp),
                    ),
                  ),
                  child: Center(
                    child: ListTile(
                      onTap: () {
                        showDialog<Widget>(
                          context: context,
                          builder: (BuildContext context) {
                            return _UserListPopUp(
                              firstName: firstName,
                              lastName: lastName,
                              email: email,
                              id: id,
                              ref: ref,
                            );
                          },
                        );
                      },
                      leading: Assets.images.users.image(
                        width: iconSize.w,
                        height: iconSize.h,
                        color: context.primaryColor,
                      ),
                      title: Text('$firstName $lastName'),
                      subtitle: Text(email),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
