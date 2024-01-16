part of '../users_page.dart';

class _SearchTextField extends ConsumerWidget {
  const _SearchTextField({
    required this.searchController,
    required this.iconSize,
  });

  final TextEditingController searchController;
  final int iconSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListState = ref.watch(userListProvider);
    return Padding(
      padding: ProjectPadding.symHXXSmall(),
      child: TextField(
        controller: searchController,
        style: context.headlineMedium,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 15.0.w, right: 10.w),
            child: Icon(
              Icons.search,
              size: iconSize.sp,
            ),
          ),
          hintText: LocaleKeys.adminPage_usersPage_search.tr(),
          hintStyle: context.headlineMedium,
        ),
        onChanged: (value) {
          if (userListState is AsyncData<List<UserModel>>) {
            ref.read(userListNotifierProvider.notifier).filterUsers(
                  value,
                  userListState.value.toList(),
                );
            ref.invalidate(userListProvider);
          }
        },
      ),
    );
  }
}
