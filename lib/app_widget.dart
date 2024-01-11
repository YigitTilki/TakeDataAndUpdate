import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/settings_page/state/theme_state.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/util/responsive/custom_responsive.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      builder: (context, child) {
        return Consumer(
          builder: (context, ref, _) {
            final theme = ref.watch(themeProvider);

            return MaterialApp.router(
              title: 'Graduating Project',
              debugShowCheckedModeBanner: false,
              theme: theme.themeData,
              //darkTheme: DarkTheme().themeData,
              builder: CustomResponsive.build,

              ///Localization
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,

              ///AutRoute
              routerConfig: _appRouter.config(),
            );
          },
        );
      },
    );
  }
}
