import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/settings_page/widgets/custom_header.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/languages/locales.dart';
import 'package:take_data_and_update_project/product/init/languages/product_localizations.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';

part '../widgets/flag_container.dart';

@RoutePage()
class ChangeLanguagePage extends StatelessWidget {
  const ChangeLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.secondaryColor,
        body: Column(
          children: [
            AppSpacer.vertical.space20,
            const _Header(),
            AppSpacer.vertical.space30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _FlagContainer(
                  language: Locales.tr,
                  image: Assets.images.trFlag,
                  flagText: LocaleKeys.settingsPage_turkish,
                ),
                AppSpacer.horizontal.space40,
                _FlagContainer(
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

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      icon: Assets.icons.changeLanguageIcon.image(),
      text: LocaleKeys.settingsPage_changeLanguage,
    );
  }
}
