import 'package:flutter_jsonplaceholder/services/RestService.dart';
import 'package:flutter_jsonplaceholder/services/posts_service/posts_service.dart';

import '../../models/Post.dart';

class PostsRest implements PostsService {
  RestService rest = RestService();

  @override
  Future<List<Post>> fetchStores() async {
    final response = await rest.get("posts");

    return (response as List).map((e) => Post.fromJson(e)).toList();
  }

  @override
  Future<Post> createPost(Post post) async {
    final newPost = await rest.post("posts", data: post);
    return Post.fromJson(newPost);
  }
}
