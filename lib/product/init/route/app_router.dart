import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/admin_page/admin_page.dart';
import 'package:take_data_and_update_project/features/auth/login_page/login_page.dart';
import 'package:take_data_and_update_project/features/auth/register_page/register_page.dart';
import 'package:take_data_and_update_project/features/auth/register_page/verify_email_page.dart';
import 'package:take_data_and_update_project/features/devices_page/devices_page.dart';
import 'package:take_data_and_update_project/features/forgot_password/pages/enter_code_page/enter_code_page.dart';
import 'package:take_data_and_update_project/features/forgot_password/pages/forgot_password_page/forgot_password_page.dart';
import 'package:take_data_and_update_project/features/forgot_password/pages/reset_password_page/reset_password_page.dart';
import 'package:take_data_and_update_project/features/home_page/home_page.dart';
import 'package:take_data_and_update_project/features/my_devices_page/my_devices_page.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/change_language_page/change_language_page.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/change_theme_page/change_theme_page.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/edit_user_page/edit_user_page.dart';
import 'package:take_data_and_update_project/features/settings_page/pages/manage_devices_page/manage_devices_page.dart';
import 'package:take_data_and_update_project/features/settings_page/settings_page.dart';
import 'package:take_data_and_update_project/features/splash_page/splash_page.dart';
import 'package:take_data_and_update_project/features/users_page/users_page.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: AdminRoute.page),
        AutoRoute(page: UsersRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: ChangeLanguageRoute.page),
        AutoRoute(page: EditUserRoute.page),
        AutoRoute(page: ChangeThemeRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: EnterCodeRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(page: VerifyEmailRoute.page),
        AutoRoute(page: ManageDevicesRoute.page),
        AutoRoute(page: DevicesRoute.page),
        AutoRoute(page: MyDevicesRoute.page),
      ];
}
