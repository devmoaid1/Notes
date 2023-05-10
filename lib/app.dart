import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/constants/app_strings.dart';
import 'package:flutter_jsonplaceholder/app/routing/router_config.dart';
import 'package:flutter_jsonplaceholder/app/theme/dark/dark_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: darkTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
