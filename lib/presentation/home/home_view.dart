import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/routing/routes.dart';
import 'package:go_router/go_router.dart';

import 'widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => context.push(addNoteRoute),
        ),
        body: const HomeBody());
  }
}
