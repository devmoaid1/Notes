import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/widgets/keyboard_dissmisble.dart';
import 'package:go_router/go_router.dart';

import '../../../app/widgets/custom_app_bar.dart';
import 'add_note_body.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDissmisable(
      child: Scaffold(
          appBar: CustomAppBar(
            onTap: () => context.pop(),
            title: "New Note",
          ),
          body: const AddNoteBody()),
    );
  }
}
