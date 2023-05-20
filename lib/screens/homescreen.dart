// ignore_for_file: prefer_const_constructors
import 'package:colornotes/models/note.dart';
import 'package:colornotes/screens/noteeditscreen.dart';
import 'package:colornotes/style/appstyle.dart';
import 'package:colornotes/widgets/notecard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appstyle.maincolor,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Delete All Notes?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('NO')),
                            TextButton(
                                onPressed: () {
                                  db.deleteAll(db.keys);
                                  Navigator.pop(context);
                                },
                                child: Text('YES'))
                          ],
                        );
                      });
                },
                icon: Icon(Icons.delete))
          ],
          backgroundColor: Appstyle.maincolor,
          elevation: 5,
          title: Text(
            'Color.Notes',
            style: Appstyle.maintext,
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(4),
            child: ValueListenableBuilder<Box<Note>>(
                builder: (BuildContext context, Box<Note> box, Widget? child) {
                  var notes = box.values.toList().cast<Note>();
                  notes.sort(
                    (a, b) {
                      return b.datentime.compareTo(a.datentime);
                    },
                  );
                  if (db.keys.isEmpty) {
                    return Expanded(
                        child: Center(
                            child: Text(
                      'No Notes',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )));
                  } else {
                    return Column(children: [
                      Text(
                        'Your Recent Notes',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: db.length,
                        itemBuilder: (BuildContext context, int index) {
                          final notee = notes[index];
                          return noteCard(note: notee);
                        },
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.fit(1),
                      ))
                    ]);
                  }
                },
                valueListenable: db.listenable())),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NoteEdit()));
          },
          backgroundColor: Color.fromARGB(255, 41, 1, 94),
          child: Icon(Icons.add),
        ));
  }
}
