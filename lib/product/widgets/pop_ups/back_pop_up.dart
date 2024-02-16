import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/widgets/pop_ups/base_pop_up.dart';

class GoLoginPopUp extends StatelessWidget {
  const GoLoginPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePopUp(
      title: 'Oturumu Kapat',
      content: 'Oturumunu kapatmak istediğinden emin misin?',
      button1: 'Evet',
      button2: 'Hayır',
      icon: Assets.icons.logOutIcon,
      onPressed1: () {
        context.router.pushAndPopUntil(
          const LoginRoute(),
          predicate: (route) => false,
        );
      },
    );
  }
}
