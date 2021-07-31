import 'package:club/models/screendata.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';


class CupertinoNavigate extends CupertinoPageRoute {
  final WidgetBuilder builder;
  CupertinoNavigate({required this.builder}) : super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
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
