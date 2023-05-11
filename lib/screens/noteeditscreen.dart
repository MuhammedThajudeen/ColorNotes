// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_logic_in_create_state

import 'dart:math';

import 'package:colornotes/style/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:colornotes/models/note.dart';

class NoteEdit extends StatefulWidget {
  NoteEdit({super.key});
  @override
  State<NoteEdit> createState() => _NoteEditState();
}

class _NoteEditState extends State<NoteEdit> {
  final _titlecontroller = TextEditingController();
  final _notecontroller = TextEditingController();
  int colorindexx = Random().nextInt(Appstyle.cardcolor.length);

  @override
  void dispose() {
    // TODO: implement dispose

    _titlecontroller.dispose();
    _notecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appstyle.cardcolor[colorindexx],
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                handlebackbutton();
              },
              icon: Icon(Icons.arrow_back)),
          elevation: 5,
          backgroundColor: Appstyle.cardcolor[colorindexx],
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Add a new Note',
            style: TextStyle(color: Colors.black),
          )),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              textCapitalization: TextCapitalization.sentences,
              style: Appstyle.titletext,
              maxLines: 1,
              maxLength: 31,
              controller: _titlecontroller,
              decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: Appstyle.titletext,
                  border: InputBorder.none),
            ),
            SizedBox(
              height: 6,
            ),
            Expanded(
              child: TextField(
                style: Appstyle.contenttext,
                maxLines: null,
                controller: _notecontroller,
                decoration: InputDecoration(
                    hintText: 'Note',
                    hintStyle: Appstyle.contenttext,
                    border: InputBorder.none),
              ),
            )
          ],
        ),
      ),
    );
  }

  void handlebackbutton() {
    if (_titlecontroller.text.isEmpty && _notecontroller.text.isEmpty) {
      Navigator.pop(context);
    } else {
      db.add(Note(
          title: _titlecontroller.text.trim(),
          content: _notecontroller.text.trim(),
          colorIndex: colorindexx));
      Navigator.pop(context);
    }
  }
}
