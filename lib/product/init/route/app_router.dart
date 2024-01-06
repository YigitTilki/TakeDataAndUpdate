import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/admin_page/admin_page.dart';
import 'package:take_data_and_update_project/features/auth/login_page/login_page.dart';
import 'package:take_data_and_update_project/features/auth/register_page/register_page.dart';
import 'package:take_data_and_update_project/features/home_page/home_page.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/change_language_page.dart';
import 'package:take_data_and_update_project/features/settings_page/settings_page.dart';
import 'package:take_data_and_update_project/features/users_page/users_page.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: AdminRoute.page),
        AutoRoute(page: UsersRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: ChangeLanguageRoute.page),
      ];
}
