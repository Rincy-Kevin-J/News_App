import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mycolor.dart';

class MyTextThemes{
  static TextStyle textheadingg= GoogleFonts.merriweather(
    fontSize:50,
    color:MyColors.textColors,
    fontWeight:FontWeight.bold,

  ) ;
  static TextStyle bodyTextStyle=TextStyle(
      fontSize:20,
      color:Colors.brown[300],
      fontStyle: FontStyle.italic
  );
}