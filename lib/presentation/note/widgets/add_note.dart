import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/widgets/keyboard_dissmisble.dart';

import 'add_note_body.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  @override
  Widget build(BuildContext context) {
    return const KeyboardDissmisable(
      child: Scaffold(body: AddNoteBody()),
    );
  }
}
