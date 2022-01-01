import 'package:flutter_jsonplaceholder/screens/posts/posts_viewModel.dart';
import 'package:flutter_jsonplaceholder/services/posts_service/posts_rest.dart';
import 'package:flutter_jsonplaceholder/services/posts_service/posts_service.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

void init() {
  di.registerLazySingleton<PostsService>(() => PostsRest());
  di.registerLazySingleton<PostViewModel>(() => PostViewModel());
}
