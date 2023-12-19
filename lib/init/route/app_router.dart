import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/src/features/admin_page/admin_page.dart';
import 'package:take_data_and_update_project/src/features/auth/presentation/login_page/login_page.dart';
import 'package:take_data_and_update_project/src/features/auth/presentation/register_page/register_page.dart';
import 'package:take_data_and_update_project/src/features/home_page/presentation/home_page.dart';
import 'package:take_data_and_update_project/src/features/users_page/presentation/users_page.dart';

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
