part of '../users_page.dart';

class _UsersList extends StatelessWidget {
  const _UsersList({
    required this.userList,
    required this.searchController,
    required this.iconSize,
  });

  final Future<List<Map<String, dynamic>>> userList;
  final TextEditingController searchController;
  final int iconSize;

  @override
  Widget build(BuildContext context) {
    const int listTileHeight = 60;
    return FutureBuilder(
      future: userList,
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Map<String, dynamic>> filteredList = snapshot.data!
              .where((user) =>
                  user['firstName']
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase()) ||
                  user['lastName']
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase()))
              .toList();

          return Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                String firstName = filteredList[index]['firstName'];
                String lastName = filteredList[index]['lastName'];
                return Padding(
                  padding: ProjectPadding.symHXXSmall() +
                      ProjectPadding.symVXSmall(),
                  child: Container(
                    height: listTileHeight.h,
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
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "$firstName $lastName",
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              });
                        },
                        leading: Assets.images.users.image(
                          width: iconSize.w,
                          height: iconSize.h,
                          color: context.primaryColor,
                        ),
                        title: Text("$firstName $lastName"),
                        subtitle: const Text("Email"),
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
