import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/theme/blue_theme.dart';
import 'package:take_data_and_update_project/product/init/theme/blush_rose.dart';
import 'package:take_data_and_update_project/product/init/theme/light_theme.dart';
import 'package:take_data_and_update_project/product/providers/theme_provider.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';
import 'package:take_data_and_update_project/product/widgets/text/medium_text.dart';

part 'widgets/theme_changer_container.dart';

@RoutePage()
class ChangeThemePage extends ConsumerWidget {
  const ChangeThemePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(themeProvider);

    return Scaffold(
      backgroundColor: context.difColor,
      body: SafeArea(
        child: Column(
          children: [
            const _Header(),
            AppSpacer.vertical.space30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _LightThemeContainer(theme: theme),
                _BlueThemeContainer(theme: theme),
              ],
            ),
            AppSpacer.vertical.space20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _BlushThemeContainer(theme: theme),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BlushThemeContainer extends StatelessWidget {
  const _BlushThemeContainer({
    required this.theme,
  });

  final ThemeNotifier theme;

  @override
  Widget build(BuildContext context) {
    return ChangeThemeContainer(
      theme: theme.blushTheme,
      primaryColor: BlushRose.homeBackgroundColor,
      secondaryColor: BlushRose.secondaryColor,
      tertiaryColor: BlushRose.tertiaryColor,
      fourthColor: BlushRose.fourthColor,
      text: LocaleKeys.settingsPage_blueTheme,
      selectedOne: theme.selectedThemeIndex == 2,
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
    return ChangeThemeContainer(
      theme: theme.blueTheme,
      primaryColor: BlueTheme.homeBackgroundColor,
      secondaryColor: BlueTheme.secondaryColor,
      tertiaryColor: BlueTheme.tertiaryColor,
      fourthColor: BlueTheme.fourthColor,
      text: LocaleKeys.settingsPage_blueTheme,
      selectedOne: theme.selectedThemeIndex == 1,
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
    return ChangeThemeContainer(
      theme: theme.lightTheme,
      primaryColor: LightTheme.homeBackgroundColor,
      secondaryColor: LightTheme.secondaryColor,
      tertiaryColor: LightTheme.tertiaryColor,
      fourthColor: LightTheme.fourthColor,
      text: LocaleKeys.settingsPage_lightTheme,
      selectedOne: theme.selectedThemeIndex == 0,
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      needBackButton: true,
      icon: Assets.icons.changeThemeIcon.image(),
      text: LocaleKeys.settingsPage_changeTheme,
    );
  }
}
