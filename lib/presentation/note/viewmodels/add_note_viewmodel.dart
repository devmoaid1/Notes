import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../../data/models/note.dart';
import '../../../data/services/notes_service/notes_service.dart';

class AddNoteViewModel extends BaseViewModel {
  late Note _note;

  AddNoteViewModel({required this.notesService});

  Note get note => _note;
  final NotesService notesService;

  void onInit() {
    _note = const Note();
  }

  void onTitleCompleted(String title) {
    _note = _note.copyWith(title: title);
    rebuildUi();
  }

  void onBodyCompleted(String body) {
    _note = _note.copyWith(body: body);
    rebuildUi();
  }

  void addNote(Note note, BuildContext context) async {
    if (_note.title!.isNotEmpty || _note.body!.isNotEmpty) {
      final response = await notesService.createNote(note);
      response.fold(
        (failure) => setError(failure.message),
        (success) {},
      );
    }

    context.pop();
  }
}
