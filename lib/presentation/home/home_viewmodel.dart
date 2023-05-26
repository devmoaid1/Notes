import 'package:flutter_jsonplaceholder/data/services/notes_service/notes_service.dart';
import 'package:stacked/stacked.dart';

import '../../data/models/note.dart';

class HomeViewmodel extends BaseViewModel {
  final NotesService notesService;

  HomeViewmodel({required this.notesService});

  List<Note> _notes = List.empty(growable: true);

  List<Note> _filteredNotes = List.empty(growable: true);

  List<Note> get notes => _notes;
  List<Note> get filteredNotes => _filteredNotes;

  void getAllNotes() async {
    setBusy(true);

    final response = await notesService.fetchNotes();

    response.fold(
      (failure) => setError(failure.message),
      (notes) => _notes = notes,
    );
    setBusy(false);
  }

  void searchNotes(String query) {
    setBusy(true); // Show loading state

    if (query.isEmpty) {
      // If the search query is empty, show all notes
      _filteredNotes = List.from(_notes);
    } else {
      // Filter notes based on the search query
      _filteredNotes = notes
          .where(
              (note) => note.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setBusy(false); // Hide loading state
    notifyListeners();
  }

  void deleteNote(Note note) async {
    _notes.remove(note);
    final response = await notesService.deleteNote(note);
    response.fold(
      (failure) => setError(failure.message),
      (success) {},
    );
    notifyListeners();
  }
}
