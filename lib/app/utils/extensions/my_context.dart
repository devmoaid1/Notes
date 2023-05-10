import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  //textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;
}
