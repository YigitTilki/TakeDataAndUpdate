import 'package:auto_route/auto_route.dart';
import 'package:take_data_and_update_project/view/admin_page/admin_page.dart';
import 'package:take_data_and_update_project/view/auth/login_page/login_page.dart';
import 'package:take_data_and_update_project/view/auth/register_page/register_page.dart';
import 'package:take_data_and_update_project/view/home_page/home_page.dart';
import 'package:take_data_and_update_project/view/users_page/users_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: AdminRoute.page, initial: true),
        AutoRoute(page: UsersRoute.page)
      ];
}
