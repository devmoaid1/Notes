import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  ThemeData get appTheme => Theme.of(this);
  //textTheme
  TextTheme get appTextTheme => Theme.of(this).textTheme;
}
