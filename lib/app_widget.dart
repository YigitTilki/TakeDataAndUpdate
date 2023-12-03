import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/core/theme/app_theme.dart';
import 'package:take_data_and_update_project/src/features/auth/presentation/login_page/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      builder: (context, child) {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark));
        return MaterialApp(
          title: "Graduating Project",
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: LoginPage(),
        );
      },
    );
  }
}
