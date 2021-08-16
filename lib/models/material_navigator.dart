import 'package:club/models/screendata.dart';
import 'package:club/screens/whole_screen.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';

class MaterialNavigator extends MaterialPageRoute {
  final Widget Function(BuildContext) builder;
  MaterialNavigator({required this.builder}) : super(builder: builder);


  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (child == WholeScreen()) {
     return child;
    } else {
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

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

}
