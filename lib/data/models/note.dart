import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Note extends Equatable {
  const Note({this.title = "", this.body = "", this.createdAt});

  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? body;
  @HiveField(3)
  final DateTime? createdAt;

  Note copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
    DateTime? createdAt,
  }) =>
      Note(
        title: title ?? this.title,
        body: body ?? this.body,
        createdAt: createdAt ?? this.createdAt,
      );

  @override
  List<Object?> get props => [title, body, createdAt];
}
