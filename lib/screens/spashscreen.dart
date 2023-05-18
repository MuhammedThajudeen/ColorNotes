// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:colornotes/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import '../style/appstyle.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      photoSize: 100,
      seconds: 4,
      navigateAfterSeconds: const Homescreen(),
      title: Text(
        'Save Your Notes Colorfully',
        style: Appstyle.maintext,
      ),
      backgroundColor: Appstyle.maincolor,
      useLoader: false,
    );
  }
}
