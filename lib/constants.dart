import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Map theme = const {
  'black': const Color.fromRGBO(50, 50, 50, 1),
  'white': const Color.fromRGBO(246, 249, 248, 1),
  'grey': const Color.fromRGBO(240, 240, 240, 1),
  'violet': const Color.fromRGBO(124, 55, 167, 1),
  'pink': const Color.fromRGBO(250, 233, 229, 1)
};

Map textstyles = {
  'login title': GoogleFonts.merriweather(
    textStyle: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: theme['black'],
    ),
  ),
  'login screen style': GoogleFonts.merriweather(
    textStyle: TextStyle(
      fontSize: 15,
      color: Colors.grey,
    ),
  ),
  'login button style': GoogleFonts.merriweather(
    textStyle: TextStyle(
      fontSize: 15,
      color: theme['white'],
    ),
  ),
  'snack bar style': GoogleFonts.merriweather(
    textStyle: TextStyle(
      fontSize: 10,
      color: theme['black'],
    ),
  ),
};

InputDecoration decoration = InputDecoration(
  focusColor: Colors.grey[400],
  fillColor: Colors.grey[400],
  hoverColor: Colors.grey[400],
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(0, 0, 0, 1),
    ),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(211, 211, 211, 1),
    ),
  ),
);
