import 'package:flutter_jsonplaceholder/app/localstorage/localstorage_provider.dart';
import 'package:flutter_jsonplaceholder/data/services/notes_service/notes_service.dart';
import 'package:flutter_jsonplaceholder/presentation/home/home_viewmodel.dart';

import 'package:get_it/get_it.dart';

import '../localstorage/hive_consumer.dart';

final di = GetIt.instance;

void init() {
  di.registerLazySingleton<LocalStorageProvider>(() => HiveStorageService());
  di.registerLazySingleton<NotesService>(
      () => NotesServiceImpl(localStorageProvider: di()));

  di.registerLazySingleton(() => HomeViewmodel(notesService: di()));
}
