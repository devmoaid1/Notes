import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  ThemeData get appTheme => Theme.of(this);
  //textTheme
  TextTheme get appTextTheme => Theme.of(this).textTheme;

  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}
