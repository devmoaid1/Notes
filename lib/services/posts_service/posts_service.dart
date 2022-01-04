import '../../models/Post.dart';

abstract class PostsService {
  Future<List<Post>> fetchStores();
  Future<Post> createPost(Post post);
  Future deletePost(int id);
  Future<Post> editPost(int id, Post uPost);
}
