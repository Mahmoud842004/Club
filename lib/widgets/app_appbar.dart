import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

theAppBar({required Widget title, List<Widget>? actions,Color? color}) {
  if (ResponsiveAddaptive.isios()) {
    return CupertinoNavigationBar(
      trailing: Row(
        children: actions ?? [],
      ),
      middle: title,
    );
  } else {
    return AppBar(
      title: title,
      actions: actions,
    );
  }
}
