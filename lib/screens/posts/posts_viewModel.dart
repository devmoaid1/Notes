import 'package:flutter/cupertino.dart';
import 'package:flutter_jsonplaceholder/services/posts_service/posts_rest.dart';

import '../../models/Post.dart';

class PostViewModel extends ChangeNotifier {
  List<Post> _postsList = []; // state

  List<Post> get posts =>
      _postsList; //each state should have a getter to use outside class

  PostsRest service = PostsRest();

  void getAllPosts() async {
    _postsList = await service.fetchStores();
    notifyListeners();
  }
}
