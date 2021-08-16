import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

const Map<String, Color> theme = const {
  'black': const Color.fromRGBO(50, 50, 50, 1),
  'white': const Color.fromRGBO(246, 249, 248, 1),
  'grey': const Color.fromRGBO(240, 240, 240, 1),
  'pink': const Color.fromRGBO(255, 192, 203, 1.0),
};

Map textstyles = {
  'large': GoogleFonts.merriweather(
    textStyle: TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: theme['black'],
    ),
  ),
  'very large': GoogleFonts.merriweather(
    textStyle: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: theme['black'],
    ),
  ),
  'small grey': GoogleFonts.merriweather(
    textStyle: TextStyle(
      fontSize: 15,
      color: Colors.grey,
    ),
  ),
  'small': GoogleFonts.merriweather(
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: theme['black'],
    ),
  ),
  'small white': GoogleFonts.merriweather(
    textStyle: TextStyle(
      fontSize: 15,
      color: theme['white'],
    ),
  ),
  'small black': GoogleFonts.merriweather(
    textStyle: TextStyle(
      fontSize: 15,
      color: theme['black'],
    ),
  ),
  'very small': GoogleFonts.merriweather(
    textStyle: TextStyle(
      fontSize: 12,
      color: theme['black'],
    ),
  ),
};

InputDecoration formfielddecoration = InputDecoration(
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
InputDecoration fielddecoration = InputDecoration(
  hintStyle: textstyles['small black'],
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(50, 50, 50, 1),
    ),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(50, 50, 50, 1),
    ),
  ),
);

InputDecoration storydecoration = InputDecoration(
  hintStyle: textstyles['small white'],
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(22),
    borderSide: BorderSide(
      color: Color.fromRGBO(246, 249, 248, 1),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(22),
    borderSide: BorderSide(
      color: Color.fromRGBO(246, 249, 248, 1),
    ),
  ),
);

List tabslist = [
  Icon(ResponsiveAddaptive.isios() ? CupertinoIcons.home : Icons.home),
  Icon(ResponsiveAddaptive.isios() ? CupertinoIcons.search : Icons.search),
  Icon(ResponsiveAddaptive.isios()
      ? CupertinoIcons.plus_app_fill
      : Icons.add_box),
  Icon(ResponsiveAddaptive.isios()
      ? CupertinoIcons.chat_bubble_text_fill
      : Icons.message),
  Icon(ResponsiveAddaptive.isios() ? CupertinoIcons.person_fill : Icons.person),
];
