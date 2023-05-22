import 'package:flutter/material.dart';

import '../../../data/models/note.dart';
import '../../note/widgets/note_card.dart';

class NotesList extends StatelessWidget {
  final List<Note> notes;
  const NotesList({
    super.key,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final note = notes[index];
        return NoteCard(
          note: note,
        );
      },
    );
  }
}
