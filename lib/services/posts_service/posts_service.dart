import '../../models/note.dart';

abstract class PostsService {
  Future<List<Note>> fetchStores();
  Future<void> createPost(Note note);
  Future<void> deletePost(int id);
  Future<void> editPost(int id, Note note);
}
