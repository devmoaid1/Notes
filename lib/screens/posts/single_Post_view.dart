import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/screens/posts/posts_viewModel.dart';
import 'package:stacked/stacked.dart';

class SinglePostPage extends ViewModelWidget<PostViewModel> {
  const SinglePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PostViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: Text("this page for post ${viewModel.postId}"),
      ),
    );
  }
}
