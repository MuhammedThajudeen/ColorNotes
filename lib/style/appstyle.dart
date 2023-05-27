// ignore_for_file: prefer_const_constructors

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
    Color(0xfff8c5d8),
    Color(0xfff7a7aa),
    Color(0xfffaf0bc),
    Color(0xfff5f6cc),
    Color(0xffd1e8cb),
    Color(0xffeaf3de),
    Color(0xffc5e7e9),
    Color(0xff88d5f1),
    Color(0xff76aedd),
    Color(0xffd5cfe7),
    Color(0xff9d93c7),
    Color(0xffc6a7d0),
    Color(0xffefdded),
    Color(0xffd7a5cb),
    Color(0xffe8c5dd),
    Color(0xff81d0d4),
  ];

  static TextStyle maintext =
      GoogleFonts.dynaPuff(fontSize: 20, color: Colors.white);
  static TextStyle titletext =
      GoogleFonts.ubuntu(fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle contenttext = GoogleFonts.nunito(fontSize: 16);
}
