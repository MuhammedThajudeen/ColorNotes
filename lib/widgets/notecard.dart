// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:colornotes/models/note.dart';
import 'package:colornotes/screens/noteeditscreen.dart';
import 'package:colornotes/screens/noteviewscreen.dart';
import 'package:colornotes/style/appstyle.dart';
import 'package:flutter/material.dart';

class noteCard extends StatelessWidget {
  const noteCard({super.key, required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NoteView(
              notee: note,
              colorid: note.colorIndex,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Appstyle.cardcolor[note.colorIndex],
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 5,
            ),
            Text(
              note.content,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
