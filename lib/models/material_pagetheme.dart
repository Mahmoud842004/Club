import 'package:club/models/screendata.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';

class AndriodPageTransition extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (route.isFirst) {
      return child;
    }
    ScreenData screenData = ResponsiveAddaptive.screendata(context);
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: Offset(screenData.screensize.width, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ),
      child: child,
    );
  }
}
