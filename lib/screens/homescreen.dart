// ignore_for_file: prefer_const_constructors
import 'package:colornotes/models/note.dart';
import 'package:colornotes/providers/delete_flag.dart';
import 'package:colornotes/screens/noteeditscreen.dart';
import 'package:colornotes/screens/noteviewscreen.dart';
import 'package:colornotes/style/appstyle.dart';
import 'package:colornotes/widgets/notecard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
                        title: Text('Delete the selected Notes?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('NO')),
                          TextButton(
                              onPressed: () {
                                final deleteFlagProvider =
                                    Provider.of<deleteflag>(context,
                                        listen: false);

                                // Retrieve the list of selected note keys
                                final selectedNoteKeys =
                                    deleteFlagProvider.getSelectedNoteKeys();
                                print('liss ${selectedNoteKeys}');

                                // Delete the selected notes using their keys
                                for (var key in selectedNoteKeys) {
                                  db.delete(key);
                                }

                                // Clear the flag list and note key list after deletion
                                deleteFlagProvider.clearFlagList();
                                deleteFlagProvider.clearNoteKeyList();

                                Navigator.pop(context);
                                deleteFlagProvider.flaglist.clear();
                              },
                              child: Text('YES'))
                        ],
                      );
                    });
              },
              icon: Icon(Icons.delete),
              color: Colors.white,
            )
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
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Your Recent Notes',
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Consumer<deleteflag>(
                              builder: (BuildContext context, deleteflag value,
                                  Widget? child) {
                                return Visibility(
                                    visible: value.flaglist.isNotEmpty,
                                    child: Text(
                                      '(${value.flaglist.length})',
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ));
                              },
                            )
                          ],
                        ),
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
            final deleteFlagProvider =
                Provider.of<deleteflag>(context, listen: false);
            deleteFlagProvider.clearFlagList();
            deleteFlagProvider.clearNoteKeyList();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NoteEdit()));
          },
          backgroundColor: Color.fromARGB(255, 41, 1, 94),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
  }
}
