import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

theAppBar(
    {required Widget title,
    List<Widget>? actions,
    Color? color,
    double? elevation,
    Color? iconscolor}) {
  if (ResponsiveAddaptive.isios()) {
    return CupertinoNavigationBar(
      trailing: Row(
        children: actions ?? [],
      ),
      middle: title,
      backgroundColor: color,
    );
  } else {
    return AppBar(
      title: title,
      actions: actions,
      backgroundColor: color,
      elevation: elevation,
      iconTheme: IconThemeData(
        color: iconscolor,
      ),
    );
  }
}
