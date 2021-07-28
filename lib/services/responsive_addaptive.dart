import 'package:club/models/screendata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ResponsiveAddaptive {
  static bool isios() {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return true;
    } else {
      return false;
    }
  }

  static ScreenData screendata(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    Size size = mediaquery.size;
    Orientation orientation = mediaquery.orientation;
    bool platformcondition = defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android
        ? true
        : false;
    if (platformcondition && orientation == Orientation.landscape) {
      return ScreenData(screensize: size, screentype: ScreenType.landscape);
    } else if (size.width >= 1200) {
      return ScreenData(screensize: size, screentype: ScreenType.web);
    } else {
      return ScreenData(screensize: size, screentype: ScreenType.phone);
    }
  }
}
