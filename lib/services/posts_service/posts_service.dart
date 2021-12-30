import '../../models/Post.dart';

abstract class PostsService {
  Future<List<Post>> fetchStores();
  Future<Post> createPost(Post post);
}
