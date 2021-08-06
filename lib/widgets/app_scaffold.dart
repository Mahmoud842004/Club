import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final appbar;
  final Widget? bottomnavigationbar;
  final Color? color;

  const AppScaffold({
    required this.body,
    this.appbar,
    this.color,
    this.bottomnavigationbar,
  });
  @override
  Widget build(BuildContext context) {
    if (ResponsiveAddaptive.isios()) {
      return CupertinoPageScaffold(
        child: Scaffold(
          body: body,
          bottomNavigationBar: bottomnavigationbar,
        ),
        navigationBar: appbar,
        backgroundColor: color,
      );
    } else {
      return Scaffold(
        body: body,
        appBar: appbar,
        backgroundColor: color,
        bottomNavigationBar: bottomnavigationbar,
      );
    }
  }
}
