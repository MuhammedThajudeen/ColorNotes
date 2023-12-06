// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types
import 'package:colornotes/models/note.dart';
import 'package:colornotes/providers/delete_flag.dart';
import 'package:colornotes/screens/noteviewscreen.dart';
import 'package:colornotes/style/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class noteCard extends StatefulWidget {
  const noteCard({super.key, required this.note});
  final Note note;

  @override
  State<noteCard> createState() => _noteCardState();
}

class _noteCardState extends State<noteCard> {
  int? flag=0;
  //List keylist=[];
  @override
  Widget build(BuildContext context) {
    return Consumer<deleteflag>(
      builder: (BuildContext context, value, Widget? child) {
        return InkWell(
          onLongPress: () {
            setState(() {
              flag = 1;
              // keylist.add(widget.note.colorIndex);
            });
            value.addflaglist();
            value.notekeylist(widget.note.key);
          },
          onTap: () {
            if (flag == 1 && value.flaglist.isNotEmpty) {
              setState(() {
                flag = 0;
              });
              value.deleteflaglist();
              value.notekeylist(widget.note.key);
            } else {
              if (value.flaglist.isNotEmpty) {
                setState(() {
                  flag = 1;
                });
                value.addflaglist();
                value.notekeylist(widget.note.key);
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NoteView(
                      notee: widget.note,
                      colorid: widget.note.colorIndex,
                    ),
                  ),
                );
              }
            }
          },
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Appstyle.cardcolor[widget.note.colorIndex],
                borderRadius: BorderRadius.circular(12),
                // border: flag == 1
                //     ? Border.all(
                //         width: 5, color: Color.fromARGB(255, 228, 249, 42))
                //     : Border.all()
                    ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Consumer<deleteflag>(
                    builder: (BuildContext context, value, Widget? child) { 
                      return Visibility(
                      visible: flag==1 && value.flaglist.isNotEmpty,
                      child: Container(
                        child: Icon(Icons.check_circle_rounded,color: Color.fromARGB(255, 0, 2, 0),size: 25,)));
                     },
                     
                  ),
                ),
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.note.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 3,
                ),
                Text(
                  DateFormat("dd MMM yyyy").format(widget.note.datentime),
                  style: TextStyle(fontSize: 11.5),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  widget.note.content,
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
              ],
            )
          ),
        );
      },
    );
  }
}
