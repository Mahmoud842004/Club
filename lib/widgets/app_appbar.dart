import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TheAppBar extends StatelessWidget {
  final Widget title;
  final List<Widget> actions;
  final Color color;

  const TheAppBar(
      {required this.title, required this.actions, required this.color});

  @override
  Widget build(BuildContext context) {
    if (ResponsiveAddaptive.isios()) {
      return CupertinoNavigationBar(
        trailing: Row(
          children: actions,
        ),
        middle: title,
        backgroundColor: color,
      );
    } else {
      return AppBar(
        title: title,
        actions: actions,
        backgroundColor: color,
      );
    }
  }
}
