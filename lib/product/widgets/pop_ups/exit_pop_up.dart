import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/widgets/pop_ups/base_pop_up.dart';

class ExitAppPopUp extends StatelessWidget {
  const ExitAppPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePopUp(
      title: 'Çıkış Yap',
      content: 'Uygulamadan çıkmak istediğinize emin misiniz',
      button1: 'Evet',
      button2: 'Hayır',
      icon: Assets.icons.logOutIcon,
      onPressed1: SystemNavigator.pop,
    );
  }
}
