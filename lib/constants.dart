import 'package:club/screens/whole_screen.dart';
import 'package:flutter/material.dart';

const Map theme = const {
  'black': const Color.fromRGBO(50, 50, 50, 1),
  'white': const Color.fromRGBO(246, 249, 248, 1),
  'grey': const Color.fromRGBO(240, 240, 240, 1),
  'violet': const Color.fromRGBO(124, 55, 167, 1),
};

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => WholeScreen(),
};
