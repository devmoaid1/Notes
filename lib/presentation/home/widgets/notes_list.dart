import 'package:flutter/material.dart';

import '../../../data/models/note.dart';

class NotesList extends StatelessWidget {
  final List<Note> notes;
  const NotesList({
    super.key,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length, // Replace with your actual list size
      itemBuilder: (BuildContext context, int index) {
        final note = notes[index];
        return ListTile(
          title: Text('Note $index'),
          subtitle: Text('Details of Note ${note.body}'),
        );
      },
    );
  }
}
