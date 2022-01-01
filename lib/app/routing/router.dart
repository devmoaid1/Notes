import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/app/di/dependency.dart';
import 'package:flutter_jsonplaceholder/app/routing/routes.dart';
import 'package:flutter_jsonplaceholder/screens/posts/posts_view.dart';
import 'package:flutter_jsonplaceholder/screens/posts/posts_viewModel.dart';
import 'package:flutter_jsonplaceholder/screens/posts/single_Post_view.dart';
import 'package:stacked/stacked.dart';

class AppRouter {
  Route<dynamic> createRoute(RouteSettings settings) {
    final postViewModel = di<PostViewModel>(); //dependency injection

    switch (settings.name) {
      case postsPage:
        return MaterialPageRoute(
            builder: (context) => ViewModelBuilder<PostViewModel>.reactive(
                viewModelBuilder: () => postViewModel,
                onModelReady: (model) => model.getAllPosts(),
                builder: (context, model, _) {
                  if (model.isLoading == true) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  }
                  if (model.error.isNotEmpty) {
                    return Center(
                      child: Text(model.error),
                    );
                  }
                  return PostsPage();
                }));

      case singlePostPage:
        return MaterialPageRoute(
            builder: (context) => ViewModelBuilder<PostViewModel>.nonReactive(
                disposeViewModel: false,
                viewModelBuilder: () => postViewModel,
                builder: (context, viewModel, _) => const SinglePostPage()));

      default:
        return MaterialPageRoute(builder: (context) => PostsPage());
    }
  }
}
