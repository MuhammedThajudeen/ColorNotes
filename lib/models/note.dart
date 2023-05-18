import 'package:hive_flutter/hive_flutter.dart';
part 'note.g.dart';

@HiveType(typeId: 1)
class Note extends HiveObject {
  @HiveField(1)
  String title;

  @HiveField(2)
  String content;

  @HiveField(3)
  int colorIndex;

  @HiveField(4)
  DateTime datentime;

  Note(
      {required this.title,
      required this.content,
      required this.colorIndex,
      required this.datentime});
}

final db = Hive.box<Note>('notedb');
