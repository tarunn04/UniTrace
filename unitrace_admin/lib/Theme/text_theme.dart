import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextTheme {
  static const TextStyle headline1 = TextStyle(
    fontSize: 96.0,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  );

  static TextStyle headline2 = TextStyle(
    fontFamily: GoogleFonts.josefinSans().fontFamily,
    fontSize: 58.0,
    fontWeight: FontWeight.w900,
    letterSpacing: -0.5,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 48.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
  );

  static TextStyle headline4 = TextStyle(
    fontFamily: GoogleFonts.lato().fontFamily,
    fontSize: 29.0,
    fontWeight: FontWeight.w900,
    letterSpacing: 0.25,
  );

  static const TextStyle headline5 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
  );

  static const TextStyle headline6 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );

  static TextStyle subtitle1 = TextStyle(
    fontFamily: GoogleFonts.ubuntu().fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
  );

  static TextStyle subtitle2 = TextStyle(
    fontFamily: GoogleFonts.ubuntu().fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.1,
  );

  static  TextStyle bodyText1 = TextStyle(
    fontFamily: GoogleFonts.ubuntu().fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  static TextStyle bodyText2 = TextStyle(
    
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  static TextStyle button = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );

  static const TextStyle overline = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
}
