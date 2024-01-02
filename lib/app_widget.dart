import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/init/route/app_router.dart';
import 'package:take_data_and_update_project/init/theme/light_theme.dart';
import 'package:take_data_and_update_project/util/responsive/custom_responsive.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Graduating Project',
          debugShowCheckedModeBanner: false,
          theme: LightTheme().themeData,
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
  }
}
