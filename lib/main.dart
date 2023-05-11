// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:colornotes/models/note.dart';
import 'package:colornotes/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(NoteAdapter().typeId)) {
    Hive.registerAdapter<Note>(NoteAdapter());
  }
  await Hive.openBox<Note>('notedb');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homescreen(),
    );
  }
}
