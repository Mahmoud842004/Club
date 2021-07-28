import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveAddaptive.isios()
        ? CupertinoApp(
            title: 'Club',
            theme: CupertinoThemeData(),
          )
        : MaterialApp(
            title: 'Club',
            theme: ThemeData(),
          );
  }
}
