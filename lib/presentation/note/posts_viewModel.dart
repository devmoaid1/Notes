import 'package:flutter/cupertino.dart';

import 'package:flutter_jsonplaceholder/data/services/posts_service/posts_service.dart';

import '../../app/di/dependency.dart';
import '../../data/models/note.dart';

class PostViewModel extends ChangeNotifier {
  final service = di<PostsService>();

  //state
  List<Note> _notes = [];
  bool _isLoading = true;
  String _error = "";

  //getters for state

  String get error => _error;
  List<Note> get notes =>
      _notes; //each state should have a getter to use outside class

  bool get isLoading => _isLoading;

  //events
  void getAllPosts() async {
    _notes = await service.fetchStores().catchError((err) => _error = err);
    _isLoading = false;
    notifyListeners();
  }

  void addPost(Note note) async {
    _isLoading = true;
    await service.createPost(note).then((value) => print("creted new note"));

    _isLoading = false;
    notifyListeners();
  }

  void deleteNote(int id) async {
    await service.deletePost(id);
    notifyListeners();
  }

  void updateNote(int id, Note note) async {
    _isLoading = true;
    await service
        .editPost(id, note)
        .then((value) => print('post edited sucessfully'))
        .catchError((err) => _error = err);

    _isLoading = false;
    notifyListeners();
  }
}
