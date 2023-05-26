import 'package:flutter_jsonplaceholder/app/routing/routes.dart';
import 'package:flutter_jsonplaceholder/data/models/note.dart';
import 'package:flutter_jsonplaceholder/presentation/home/home_view.dart';
import 'package:flutter_jsonplaceholder/presentation/note/note_view.dart';
import 'package:flutter_jsonplaceholder/presentation/note/widgets/add_note.dart';
import 'package:flutter_jsonplaceholder/presentation/note/widgets/edit_note.dart';
import 'package:flutter_jsonplaceholder/presentation/splash/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _router = GoRouter(
      initialLocation: splashRoute,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: splashRoute,
          builder: (context, state) => const SplashView(),
        ),
        GoRoute(
          path: homeRoute,
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: noteRoute,
          builder: (context, state) => NoteView(
            note: state.extra as Note,
          ),
        ),
        GoRoute(
          path: addNoteRoute,
          builder: (context, state) => AddNoteView(note: state.extra as Note?),
        ),
        GoRoute(
          path: editNoteRoute,
          builder: (context, state) => EditNoteView(
            note: state.extra as Note,
          ),
        ),
      ]);

  static GoRouter get router => _router;
}
