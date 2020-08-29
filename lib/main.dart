import 'package:flutter/material.dart';
import 'package:flutterlooks/login/login_page1.dart';
import 'package:flutterlooks/onboarding/onboarding_page1.dart';
import 'package:google_fonts/google_fonts.dart';

import 'coolors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage1(),
      theme: ThemeData(
        accentColor: Coolors.purplish,
        primaryColor: Coolors.orangish,
        fontFamily: GoogleFonts.dmSans().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
