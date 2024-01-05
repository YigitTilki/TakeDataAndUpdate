import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/settings_page/widgets/flag_container.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/languages/locales.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';

@RoutePage()
class ChangeLanguagePage extends StatelessWidget {
  const ChangeLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.settingsPage_changeLanguage.tr()),
          shape: BeveledRectangleBorder(
            side: BorderSide(color: context.fourthColor),
          ),
        ),
        body: Column(
          children: [
            AppSpacer.vertical.space20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlagContainer(
                  language: Locales.tr,
                  image: Assets.images.trFlag,
                  flagText: LocaleKeys.settingsPage_turkish,
                ),
                FlagContainer(
                  language: Locales.en,
                  image: Assets.images.ukFlag,
                  flagText: LocaleKeys.settingsPage_english,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
