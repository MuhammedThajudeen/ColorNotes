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
    const Color(0xfff8c5d8),
    const Color(0xfff7a7aa),
    const Color(0xfffaf0bc),
    const Color(0xfff5f6cc),
    const Color(0xffd1e8cb),
    const Color(0xffeaf3de),
    const Color(0xffc5e7e9),
    const Color(0xff88d5f1),
    const Color(0xff76aedd),
    const Color(0xffd5cfe7),
    const Color(0xff9d93c7),
    const Color(0xffc6a7d0),
    const Color(0xffefdded),
    const Color(0xffd7a5cb),
    const Color(0xffe8c5dd),
    const Color(0xff81d0d4),
  ];

  static TextStyle maintext =
      GoogleFonts.dynaPuff(fontSize: 20, color: Colors.white);
  static TextStyle titletext =
      GoogleFonts.ubuntu(fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle contenttext = 
      GoogleFonts.nunito(fontSize: 16);
  static TextStyle notescreenheadingtextstyle = 
      GoogleFonts.poppins(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600);
  static TextStyle deletemsgtxtstyle = 
      GoogleFonts.poppins(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w600);
  static TextStyle deletemsgoptionstyle = 
      GoogleFonts.poppins(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600);
}
