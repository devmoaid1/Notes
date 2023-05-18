import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/theme/dark/dark_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/text_styles.dart';

final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: AppDarkColors.kPrimaryColor,
    hintColor: AppDarkColors.khintColor,
    textTheme: TextTheme(
        bodyLarge: Styles.kbodyLargeTextStyle,
        bodyMedium: Styles.kbodyMediumTextStyle,
        bodySmall: Styles.kbodysmallTextStyle,
        headlineLarge: Styles.kHeadingTextStyle),
    progressIndicatorTheme: ProgressIndicatorThemeData(
        circularTrackColor: AppDarkColors.kPrimaryColor,
        color: AppDarkColors.kPrimaryColor.withOpacity(0.6)),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppDarkColors.kPrimaryColor,
        elevation: 1,
        iconSize: 20.sp));
