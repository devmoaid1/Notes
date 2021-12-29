import '../../models/Post.dart';

abstract class PostsService {
  Future<List<Post>> fetchStores();
}
