// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AdminRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdminPage(),
      );
    },
    AlertBoxRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AlertBoxPage(),
      );
    },
    ChangeLanguageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangeLanguagePage(),
      );
    },
    ChangeThemeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangeThemePage(),
      );
    },
    ChosenDeviceRoute.name: (routeData) {
      final args = routeData.argsAs<ChosenDeviceRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChosenDevicePage(
          args.deviceModel,
          key: args.key,
        ),
      );
    },
    DevicesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DevicesPage(),
      );
    },
    EditUserRoute.name: (routeData) {
      final args = routeData.argsAs<EditUserRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditUserPage(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
    EnterCodeRoute.name: (routeData) {
      final args = routeData.argsAs<EnterCodeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EnterCodePage(
          code: args.code,
          email: args.email,
          key: args.key,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    ManageDevicesRoute.name: (routeData) {
      final args = routeData.argsAs<ManageDevicesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ManageDevicesPage(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
    MyDevicesRoute.name: (routeData) {
      final args = routeData.argsAs<MyDevicesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyDevicesPage(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResetPasswordPage(
          email: args.email,
          key: args.key,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsPage(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    UsersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UsersPage(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyEmailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerifyEmailPage(
          code: args.code,
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [AdminPage]
class AdminRoute extends PageRouteInfo<void> {
  const AdminRoute({List<PageRouteInfo>? children})
      : super(
          AdminRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AlertBoxPage]
class AlertBoxRoute extends PageRouteInfo<void> {
  const AlertBoxRoute({List<PageRouteInfo>? children})
      : super(
          AlertBoxRoute.name,
          initialChildren: children,
        );

  static const String name = 'AlertBoxRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangeLanguagePage]
class ChangeLanguageRoute extends PageRouteInfo<void> {
  const ChangeLanguageRoute({List<PageRouteInfo>? children})
      : super(
          ChangeLanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangeLanguageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangeThemePage]
class ChangeThemeRoute extends PageRouteInfo<void> {
  const ChangeThemeRoute({List<PageRouteInfo>? children})
      : super(
          ChangeThemeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangeThemeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChosenDevicePage]
class ChosenDeviceRoute extends PageRouteInfo<ChosenDeviceRouteArgs> {
  ChosenDeviceRoute({
    required DeviceModel deviceModel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ChosenDeviceRoute.name,
          args: ChosenDeviceRouteArgs(
            deviceModel: deviceModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ChosenDeviceRoute';

  static const PageInfo<ChosenDeviceRouteArgs> page =
      PageInfo<ChosenDeviceRouteArgs>(name);
}

class ChosenDeviceRouteArgs {
  const ChosenDeviceRouteArgs({
    required this.deviceModel,
    this.key,
  });

  final DeviceModel deviceModel;

  final Key? key;

  @override
  String toString() {
    return 'ChosenDeviceRouteArgs{deviceModel: $deviceModel, key: $key}';
  }
}

/// generated route for
/// [DevicesPage]
class DevicesRoute extends PageRouteInfo<void> {
  const DevicesRoute({List<PageRouteInfo>? children})
      : super(
          DevicesRoute.name,
          initialChildren: children,
        );

  static const String name = 'DevicesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditUserPage]
class EditUserRoute extends PageRouteInfo<EditUserRouteArgs> {
  EditUserRoute({
    required UserModel userModel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditUserRoute.name,
          args: EditUserRouteArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditUserRoute';

  static const PageInfo<EditUserRouteArgs> page =
      PageInfo<EditUserRouteArgs>(name);
}

class EditUserRouteArgs {
  const EditUserRouteArgs({
    required this.userModel,
    this.key,
  });

  final UserModel userModel;

  final Key? key;

  @override
  String toString() {
    return 'EditUserRouteArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [EnterCodePage]
class EnterCodeRoute extends PageRouteInfo<EnterCodeRouteArgs> {
  EnterCodeRoute({
    required int code,
    required String email,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EnterCodeRoute.name,
          args: EnterCodeRouteArgs(
            code: code,
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EnterCodeRoute';

  static const PageInfo<EnterCodeRouteArgs> page =
      PageInfo<EnterCodeRouteArgs>(name);
}

class EnterCodeRouteArgs {
  const EnterCodeRouteArgs({
    required this.code,
    required this.email,
    this.key,
  });

  final int code;

  final String email;

  final Key? key;

  @override
  String toString() {
    return 'EnterCodeRouteArgs{code: $code, email: $email, key: $key}';
  }
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    required UserModel userModel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    required this.userModel,
    this.key,
  });

  final UserModel userModel;

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ManageDevicesPage]
class ManageDevicesRoute extends PageRouteInfo<ManageDevicesRouteArgs> {
  ManageDevicesRoute({
    required UserModel userModel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ManageDevicesRoute.name,
          args: ManageDevicesRouteArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ManageDevicesRoute';

  static const PageInfo<ManageDevicesRouteArgs> page =
      PageInfo<ManageDevicesRouteArgs>(name);
}

class ManageDevicesRouteArgs {
  const ManageDevicesRouteArgs({
    required this.userModel,
    this.key,
  });

  final UserModel userModel;

  final Key? key;

  @override
  String toString() {
    return 'ManageDevicesRouteArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [MyDevicesPage]
class MyDevicesRoute extends PageRouteInfo<MyDevicesRouteArgs> {
  MyDevicesRoute({
    required UserModel userModel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MyDevicesRoute.name,
          args: MyDevicesRouteArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MyDevicesRoute';

  static const PageInfo<MyDevicesRouteArgs> page =
      PageInfo<MyDevicesRouteArgs>(name);
}

class MyDevicesRouteArgs {
  const MyDevicesRouteArgs({
    required this.userModel,
    this.key,
  });

  final UserModel userModel;

  final Key? key;

  @override
  String toString() {
    return 'MyDevicesRouteArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResetPasswordPage]
class ResetPasswordRoute extends PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    required String email,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ResetPasswordRoute.name,
          args: ResetPasswordRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const PageInfo<ResetPasswordRouteArgs> page =
      PageInfo<ResetPasswordRouteArgs>(name);
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    required this.email,
    this.key,
  });

  final String email;

  final Key? key;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    required UserModel userModel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<SettingsRouteArgs> page =
      PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({
    required this.userModel,
    this.key,
  });

  final UserModel userModel;

  final Key? key;

  @override
  String toString() {
    return 'SettingsRouteArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UsersPage]
class UsersRoute extends PageRouteInfo<void> {
  const UsersRoute({List<PageRouteInfo>? children})
      : super(
          UsersRoute.name,
          initialChildren: children,
        );

  static const String name = 'UsersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyEmailPage]
class VerifyEmailRoute extends PageRouteInfo<VerifyEmailRouteArgs> {
  VerifyEmailRoute({
    required int code,
    required UserModel userModel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          VerifyEmailRoute.name,
          args: VerifyEmailRouteArgs(
            code: code,
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const PageInfo<VerifyEmailRouteArgs> page =
      PageInfo<VerifyEmailRouteArgs>(name);
}

class VerifyEmailRouteArgs {
  const VerifyEmailRouteArgs({
    required this.code,
    required this.userModel,
    this.key,
  });

  final int code;

  final UserModel userModel;

  final Key? key;

  @override
  String toString() {
    return 'VerifyEmailRouteArgs{code: $code, userModel: $userModel, key: $key}';
  }
}
