import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/theme/dark/dark_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: AppDarkColors.kPrimaryColor,
    textTheme: const TextTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppDarkColors.kPrimaryColor,
        elevation: 1,
        iconSize: 20.sp));
