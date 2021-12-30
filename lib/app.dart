import 'package:flutter/material.dart';

import 'screens/posts/posts_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 250, 35, 71),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          primarySwatch: Colors.blue,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color.fromARGB(255, 250, 35, 71),
            elevation: 2,
          )),
      home: PostsPage(),
    );
  }
}
