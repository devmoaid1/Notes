import 'package:flutter_jsonplaceholder/data/services/notes_service/notes_service.dart';
import 'package:stacked/stacked.dart';

import '../../data/models/note.dart';

class HomeViewmodel extends BaseViewModel {
  final NotesService notesService;

  HomeViewmodel({required this.notesService});

  List<Note> _notes = List.empty(growable: true);

  String _error = '';

  String get errorMessage => _error;

  List<Note> get notes => _notes;

  void getAllPosts() async {
    setBusy(true);
    final response = await notesService.fetchNotes();

    response.fold(
      (failure) => _error = failure.message,
      (notes) => _notes = notes,
    );
    setBusy(false);
    // notifyListeners();
  }

  void addPost(Note note) async {
    setBusy(true);
    _notes.add(note);
    final response = await notesService.createNote(note);
    response.fold(
      (failure) => _error = failure.message,
      (success) {},
    );

    setBusy(false);
  }

  void deleteNote(Note note) async {
    _notes.remove(note);
    final response = await notesService.deleteNote(note);
    response.fold(
      (failure) => _error = failure.message,
      (success) {},
    );
    notifyListeners();
  }
}
