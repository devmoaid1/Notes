import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app.dart';
import 'package:flutter_jsonplaceholder/app/di/dependency.dart' as di;
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  di.init();
  await Hive.initFlutter();
  runApp(const NotesApp());
}
