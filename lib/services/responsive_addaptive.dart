import 'package:club/models/cupertino_navigator.dart';
import 'package:club/models/screendata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:translator/translator.dart';

class ResponsiveAddaptive {
  static bool isios() {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return true;
    } else {
      return false;
    }
  }

  static void pushnavigate({
    required BuildContext context,
    required Widget screen,
    required String routename,
  }) {
    if (ResponsiveAddaptive.screendata(context).screentype == ScreenType.web) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return screen;
        },
      );
    } else {
      if (ResponsiveAddaptive.isios()) {
        Navigator.of(context).push(
          CupertinoNavigate(
            builder: (context) {
              return screen;
            },
          ),
        );
      } else {
        Navigator.of(context).pushNamed(routename);
      }
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
      print(size.width);
      return ScreenData(screensize: size, screentype: ScreenType.web);
    } else {
      return ScreenData(screensize: size, screentype: ScreenType.phone);
    }
  }

  static bool isweb() {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      return false;
    }
    return true;
  }

  static Future<String> translate(BuildContext context, String text) async {
    if (context.locale == Locale('ar')) {
      var translator =
          await GoogleTranslator().translate(text, from: 'en', to: 'ar');
      return translator.text;
    }
    return text;
  }
}
