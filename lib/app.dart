import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/routing/router.dart';
import 'package:flutter_jsonplaceholder/app/routing/routes.dart';

import 'screens/posts/posts_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 250, 35, 71),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          primarySwatch: Colors.blue,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color.fromARGB(255, 250, 35, 71),
            elevation: 2,
          )),
      initialRoute: postsPage,
      onGenerateRoute: AppRouter().createRoute,
    );
  }
}
