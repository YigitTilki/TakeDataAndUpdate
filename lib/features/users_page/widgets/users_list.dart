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
    return FutureBuilder(
      future: userList,
      builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<UserModel> filteredList = snapshot.data!
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
                UserModel user = filteredList[index];

                String firstName = user.firstName!;
                String lastName = user.lastName!;
                String email = user.email!;
                String id = user.id!;

                return Padding(
                  padding: ProjectPadding.symHXXSmall() +
                      ProjectPadding.symVXSmall(),
                  child: Container(
                    height: 60.h,
                    decoration: ShapeDecoration(
                      color: context.fourthColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                        side: BorderSide(
                            color: context.primaryColor, width: 2.sp),
                      ),
                    ),
                    child: Center(
                      child: ListTile(
                        onTap: () {
                          usersInfoPopUp(context, firstName, lastName, id);
                        },
                        leading: Assets.images.users.image(
                          width: iconSize.w,
                          height: iconSize.h,
                          color: context.primaryColor,
                        ),
                        title: Text("$firstName $lastName"),
                        subtitle: Text(email),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
