import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:take_data_and_update_project/features/splash_page/splash_page.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/providers/splash_provider.dart';
import 'package:take_data_and_update_project/product/util/show_dialog.dart';
import 'package:take_data_and_update_project/product/widgets/pop_ups/no_wifi_pop_up.dart';

mixin SplashViewListenMixin on ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    ref.read(splashProvider.notifier).checkApplicationVersion(''.ext.version);
    ref.read(splashProvider.notifier).checkInternetConnection();
    ref.read(splashProvider.notifier).checkRememberMe();
  }

  void listenAndNavigate() {
    ref.listen(splashProvider, (previous, next) {
      if (kIsWeb) {
        context.router.replace(const LoginRoute());
      } else {
        if (next.isRequiredForceUpdate ?? false) {
          showAboutDialog(context: context);
          return;
        } else if (next.isConnected == false) {
          show(
            context,
            NoWifiPopUp(
              navigator: () {
                context.router.popForced();
                if (next.isRedirectHome != null) {
                  if (next.isRedirectHome!) {
                    if (next.rememberMe == false) {
                      context.router.replace(const LoginRoute());
                    } else {
                      context.router.replace(
                        HomeRoute(
                          userModel: next.userModel ?? const UserModel(),
                        ),
                      );
                    }
                    return;
                  }
                }
              },
            ),
          );
          return;
        }
        if (next.isRedirectHome != null) {
          if (next.isRedirectHome!) {
            if (next.rememberMe == false) {
              context.router.replace(const LoginRoute());
            } else {
              context.router.replace(
                HomeRoute(userModel: next.userModel ?? const UserModel()),
              );
            }
            return;
          }
        }
      }
    });
  }
}
