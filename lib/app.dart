import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/routing/router.dart';
import 'package:flutter_jsonplaceholder/app/routing/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color.fromARGB(249, 207, 33, 77),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
