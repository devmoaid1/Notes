import 'package:flutter/cupertino.dart';
import 'package:flutter_jsonplaceholder/services/posts_service/posts_rest.dart';

import '../../models/Post.dart';

class PostViewModel extends ChangeNotifier {
  List<Post> _postsList = []; // state
  bool _isLoading = true;
  String _error = "";
  int _postId = 0;

  int get postId => _postId;
  String get error => _error;
  List<Post> get posts =>
      _postsList; //each state should have a getter to use outside class

  bool get isLoading => _isLoading;
  PostsRest service = PostsRest();

  void getAllPosts() async {
    _postsList = await service.fetchStores().catchError((err) => _error = err);
    _isLoading = false;
    notifyListeners();
  }

  void addPost(Post post) async {
    _isLoading = true;
    final newPost = await service.createPost(post);

    _postsList.add(newPost);
    _isLoading = false;
    notifyListeners();
  }

  void setPostID(int index) {
    _postId = index;
    notifyListeners();
  }
}
