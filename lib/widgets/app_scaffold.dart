import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final appbar;
  final Widget? bottomnavigationbar;
  final Color? color;
  final bool resizeToAvoidBottomInset;

  const AppScaffold({
    required this.body,
    this.appbar,
    this.color,
    this.bottomnavigationbar,
    this.resizeToAvoidBottomInset = true,
  });
  @override
  Widget build(BuildContext context) {
    if (ResponsiveAddaptive.isios()) {
      return CupertinoPageScaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        child: Scaffold(
          body: body,
          bottomNavigationBar: bottomnavigationbar,
        ),
        navigationBar: appbar,
        backgroundColor: color,
      );
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: body,
        appBar: appbar,
        backgroundColor: color,
        bottomNavigationBar: bottomnavigationbar,
      );
    }
  }
}
