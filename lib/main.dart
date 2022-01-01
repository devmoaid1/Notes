import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app.dart';
import 'package:flutter_jsonplaceholder/app/di/dependency.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}
