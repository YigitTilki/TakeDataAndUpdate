import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/settings_page/state/theme_state.dart';
import 'package:take_data_and_update_project/features/settings_page/widgets/theme_changer_container.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/theme/blue_theme.dart';
import 'package:take_data_and_update_project/product/init/theme/light_theme.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/custom_header.dart';
import 'package:take_data_and_update_project/product/widgets/text/settings_page_text.dart';

@RoutePage()
class ChangeThemePage extends ConsumerWidget {
  const ChangeThemePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(themeProvider);

    return Scaffold(
      backgroundColor: context.difColor,
      body: Padding(
        padding: ProjectPadding.topXXLarge(),
        child: Column(
          children: [
            AppSpacer.vertical.space20,
            const _Header(),
            AppSpacer.vertical.space30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _LightThemeContainer(theme: theme),
                _BlueThemeContainer(theme: theme),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BlueThemeContainer extends StatelessWidget {
  const _BlueThemeContainer({
    required this.theme,
  });

  final ThemeNotifier theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: theme.blueTheme,
          child: const ThemeChangerContainer(
            color1: BlueTheme.homeBackgroundColor,
            color2: BlueTheme.secondaryColor,
            color3: BlueTheme.tertiaryColor,
            color4: BlueTheme.fourthColor,
          ),
        ),
        AppSpacer.vertical.space5,
        const SettingsPageText(
          value: LocaleKeys.settingsPage_blueTheme,
        ),
      ],
    );
  }
}

class _LightThemeContainer extends StatelessWidget {
  const _LightThemeContainer({
    required this.theme,
  });

  final ThemeNotifier theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: theme.lightTheme,
          child: const ThemeChangerContainer(
            color1: LightTheme.homeBackgroundColor,
            color2: LightTheme.secondaryColor,
            color3: LightTheme.tertiaryColor,
            color4: LightTheme.fourthColor,
          ),
        ),
        AppSpacer.vertical.space5,
        const SettingsPageText(
          value: LocaleKeys.settingsPage_lightTheme,
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      icon: Assets.icons.changeThemeIcon.image(),
      text: LocaleKeys.settingsPage_changeTheme,
    );
  }
}
