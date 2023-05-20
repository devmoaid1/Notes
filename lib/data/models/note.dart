import 'package:equatable/equatable.dart';

class Note extends Equatable {
  const Note(
      {this.userId = 0,
      this.id = 0,
      this.title = "",
      this.body = "",
      this.createdAt});

  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  final DateTime? createdAt;

  Note copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
    DateTime? createdAt,
  }) =>
      Note(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        createdAt: createdAt ?? this.createdAt,
      );

  @override
  List<Object?> get props => [userId, id, title, body, createdAt];
}
