import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/core/route/app_router.dart';
import 'package:take_data_and_update_project/core/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      builder: (context, child) {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark));
        return MaterialApp.router(
          title: "Graduating Project",
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
