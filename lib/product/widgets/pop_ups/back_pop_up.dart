import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/providers/splash_provider.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/widgets/pop_ups/base_pop_up.dart';

class GoLoginPopUp extends ConsumerWidget {
  const GoLoginPopUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePopUp(
      title: 'Oturumu Kapat',
      content: 'Oturumunu kapatmak istediğinden emin misin?',
      button1: 'Evet',
      button2: 'Hayır',
      icon: Assets.icons.logOutIcon,
      onPressed1: () async {
        await ref
            .read(splashProvider.notifier)
            .saveRememberMe(userModel: const UserModel());

        await context.router.pushAndPopUntil(
          const LoginRoute(),
          predicate: (route) => false,
        );
      },
    );
  }
}
