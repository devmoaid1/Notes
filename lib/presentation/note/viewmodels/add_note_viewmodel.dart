import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/routing/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../../data/models/note.dart';
import '../../../data/services/notes_service/notes_service.dart';

class AddNoteViewModel extends BaseViewModel {
  late Note _note;

  AddNoteViewModel({required this.notesService});

  Note get note => _note;
  final NotesService notesService;

  void onInit([Note? note]) {
    // if there is note set it else set to new note
    if (note != null) {
      _note = note;
    } else {
      _note = const Note();
    }
  }

  void onTitleCompleted(String title) {
    _note = _note.copyWith(title: title);
    rebuildUi();
  }

  void onBodyCompleted(String body) {
    _note = _note.copyWith(body: body);
    rebuildUi();
  }

  void addNote(String title, String body, BuildContext context) async {
    if (title.isNotEmpty || body.isNotEmpty) {
      _note =
          _note.copyWith(title: title, body: body, createdAt: DateTime.now());
      final response = await notesService.createNote(note);
      response.fold(
        (failure) => setError(failure.message),
        (success) {},
      );
    }

    context.pushReplacement(homeRoute);
  }

  void editNote(String title, String body, BuildContext context) async {
    Note editedNote =
        Note(body: body, title: title, createdAt: _note.createdAt);

    if (editedNote != _note) {
      editedNote = editedNote.copyWith(createdAt: DateTime.now());
      final response = await notesService.editNote(editedNote, _note);
      response.fold(
        (failure) => setError(failure.message),
        (success) {},
      );
    }

    context.pushReplacement(homeRoute);
  }
}
