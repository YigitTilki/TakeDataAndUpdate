part of '../users_page.dart';

class _UsersPageDivider extends StatelessWidget {
  const _UsersPageDivider();

  @override
  Widget build(BuildContext context) {
    const int dividerIndent = 6;
    return Divider(
      endIndent: dividerIndent.w,
      indent: dividerIndent.w,
      thickness: 3.h,
      color: context.primaryColor,
    );
  }
}
