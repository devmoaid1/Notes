import 'package:flutter/cupertino.dart';

import 'package:flutter_jsonplaceholder/services/posts_service/posts_service.dart';

import '../../app/di/dependency.dart';
import '../../models/Post.dart';

class PostViewModel extends ChangeNotifier {
  final service = di<PostsService>();

  //state
  List<Post> _postsList = [];
  bool _isLoading = true;
  String _error = "";
  Post _post = Post();

  //getters for state
  Post get post => _post;
  String get error => _error;
  List<Post> get posts =>
      _postsList; //each state should have a getter to use outside class

  bool get isLoading => _isLoading;

  //events
  void getAllPosts() async {
    _postsList = await service.fetchStores().catchError((err) => _error = err);
    _isLoading = false;
    notifyListeners();
  }

  void addPost(Post post) async {
    _isLoading = true;
    await service.createPost(post).then((value) => print("creted new post"));

    _isLoading = false;
    notifyListeners();
  }

  void setPost(Post post) {
    _post = post;
    notifyListeners();
  }
}
