import 'package:dartz/dartz.dart';
import 'package:flutter_jsonplaceholder/app/constants/app_strings.dart';
import 'package:flutter_jsonplaceholder/app/errors/exceptions.dart';
import 'package:flutter_jsonplaceholder/app/errors/faliures.dart';
import 'package:flutter_jsonplaceholder/app/localstorage/localstorage_provider.dart';
import 'package:hive/hive.dart';

import '../../models/note.dart';

abstract class NotesService {
  Future<Either<Failure, List<Note>>> fetchNotes();
  Future<Either<Failure, void>> createNote(Note note);
  Future<Either<Failure, void>> deleteNote(Note note);
  Future<Either<Failure, void>> editNote(Note note, Note oldNote);
}

class NotesServiceImpl implements NotesService {
  final HiveStorageProvider localStorageProvider;

  NotesServiceImpl({required this.localStorageProvider});

  @override
  Future<Either<Failure, void>> createNote(Note note) async {
    try {
      final resposne =
          await localStorageProvider.addData<Note>(note, AppStrings.notesBox);
      return Right(resposne);
    } on CacheException catch (err) {
      return Left(Failure(message: err.message!));
    }
  }

  @override
  Future<Either<Failure, void>> deleteNote(Note note) async {
    try {
      final resposne = await localStorageProvider.removeData<Note>(
          note, AppStrings.notesBox);
      return Right(resposne);
    } on CacheException catch (err) {
      return Left(Failure(message: err.message!));
    }
  }

  @override
  Future<Either<Failure, void>> editNote(Note note, Note oldNote) async {
    try {
      final resposne = await localStorageProvider.editData<Note>(
          note, oldNote, AppStrings.notesBox);
      return Right(resposne);
    } on CacheException catch (err) {
      return Left(Failure(message: err.message!));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> fetchNotes() async {
    List<Note> notes = [];
    try {
      // if box closed open it
      if (!Hive.isBoxOpen(AppStrings.notesBox)) {
        await Hive.openBox<Note>(AppStrings.notesBox);
      }
      final box = Hive.box<Note>(AppStrings.notesBox);
      notes = box.values.toList();

      return Right(notes);
    } catch (err) {
      return const Left(Failure(message: 'cache error,failed to get notes'));
    }
  }
}
