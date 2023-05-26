import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/widgets/keyboard_dissmisble.dart';

import '../../../data/models/note.dart';
import 'add_note_body.dart';

class AddNoteView extends StatelessWidget {
  final Note? note;
  const AddNoteView({super.key, this.note});

  @override
  Widget build(BuildContext context) {
    return KeyboardDissmisable(
      child: Scaffold(
          body: AddNoteBody(
        note: note,
      )),
    );
  }
}
