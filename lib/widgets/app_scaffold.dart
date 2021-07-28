import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final appbar;

  const AppScaffold({required this.body, this.appbar});
  @override
  Widget build(BuildContext context) {
    if (ResponsiveAddaptive.isios()) {
      return CupertinoPageScaffold(
        child: body,
        navigationBar: appbar,
      );
    } else {
      return Scaffold(
        body: body,
        appBar: appbar,
      );
    }
  }
}
