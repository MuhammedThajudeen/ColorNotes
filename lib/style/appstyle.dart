import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appstyle {
  static Color maincolor = const Color.fromARGB(255, 20, 0, 46);

  Color getrandomcolor() {
    final random = Random();
    return cardcolor[random.nextInt(cardcolor.length)];
  }

  static List cardcolor = [
    Colors.white,
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.red.shade100,
    Colors.yellow.shade100,
    Colors.orange.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.grey.shade100,
  ];

  static TextStyle maintext =
      GoogleFonts.dynaPuff(fontSize: 20, color: Colors.white);
  static TextStyle titletext =
      GoogleFonts.ubuntu(fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle contenttext = GoogleFonts.nunito(fontSize: 16);
}
