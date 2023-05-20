// ignore_for_file: prefer_const_constructors, no_logic_in_create_state

import 'package:colornotes/style/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:colornotes/models/note.dart';
import 'package:intl/intl.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key, required this.notee, required this.colorid});
  final Note notee;
  final int colorid;

  @override
  State<NoteView> createState() => _NoteViewState(notee);
}

class _NoteViewState extends State<NoteView> {
  final Note note;

  final _titlecontroller = TextEditingController();
  final _notecontroller = TextEditingController();

  late String titletemp;
  late String contenttemp;

  @override
  void dispose() {
    //

    _titlecontroller.dispose();
    _notecontroller.dispose();
    super.dispose();
  }

  _NoteViewState(this.note);

  @override
  Widget build(BuildContext context) {
    _titlecontroller.text = note.title;
    _notecontroller.text = note.content;
    titletemp = note.title;
    contenttemp = note.content;
    return WillPopScope(
      onWillPop: () {
        return handlebackbutton();
      },
      child: Scaffold(
        backgroundColor: Appstyle.cardcolor[note.colorIndex],
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Are you sure want to delete?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('NO')),
                              TextButton(
                                  onPressed: () {
                                    db.delete(note.key);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Text('YES'))
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.delete))
            ],
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  handlebackbutton();
                },
                icon: Icon(Icons.arrow_back)),
            elevation: 5,
            backgroundColor: Appstyle.cardcolor[note.colorIndex],
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'Your Note',
              style: TextStyle(color: Colors.black),
            )),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: Appstyle.titletext,
                ),
                controller: _titlecontroller,
                style: Appstyle.titletext,
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'Edited ${DateFormat("dd MMM yyyy").format(note.datentime)}',
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(height: 6),
              Expanded(
                child: TextField(
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
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
      ),
    );
  }

  handlebackbutton() {
    if ((titletemp != _titlecontroller.text.trim()) ||
        (contenttemp != _notecontroller.text.trim())) {
      db.put(
          note.key,
          Note(
              title: _titlecontroller.text.trim(),
              content: _notecontroller.text.trim(),
              colorIndex: note.colorIndex,
              datentime: DateTime.now()));
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
    }
  }
}
