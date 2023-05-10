import 'package:flutter_jsonplaceholder/presentation/note/posts_viewModel.dart';

import 'package:get_it/get_it.dart';

final di = GetIt.instance;

void init() {
  di.registerLazySingleton<PostViewModel>(() => PostViewModel());
}
