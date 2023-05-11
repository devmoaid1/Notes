import 'package:flutter_jsonplaceholder/app/localstorage/localstorage_provider.dart';
import 'package:flutter_jsonplaceholder/presentation/note/posts_viewModel.dart';

import 'package:get_it/get_it.dart';

import '../localstorage/hive_consumer.dart';

final di = GetIt.instance;

void init() {
  di.registerLazySingleton<LocalStorageProvider>(() => HiveStorageService());
  di.registerLazySingleton<PostViewModel>(() => PostViewModel());
}
