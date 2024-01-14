import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:take_data_and_update_project/features/splash/splash_view.dart';
import 'package:take_data_and_update_project/product/base/base_providers.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';

mixin SplashViewListenMixin on ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();

    ref.read(splashProvider.notifier).checkApplicationVersion(''.ext.version);
    ref.read(splashProvider.notifier).checkInternetConnection();
  }

  void listenAndNavigate() {
    ref.listen(splashProvider, (previous, next) {
      if (next.isRequiredForceUpdate ?? false) {
        showAboutDialog(context: context);
        return;
      }
      if (next.isConnected == false) {
        showDialog<Widget>(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('No Internet'),
            );
          },
        );
        return;
      }
      if (next.isRedirectHome != null) {
        if (next.isRedirectHome!) {
          context.router.replace(const LoginRoute());
        } else {}
      }
    });
  }
}
