// ignore_for_file: non_constant_identifier_names

import 'note.dart';
import 'package:hive_flutter/hive_flutter.dart';

var opendb = Hive.openBox<Note>('notedb');

Future addnote(Note value) async {
  await opendb;
  final db = Hive.box('notedb');
  db.add(value);
}
