import 'package:flutter/cupertino.dart';

class ScreenData {
  final ScreenType screentype;
  final Size screensize;
  ScreenData({required this.screensize, required this.screentype});
}

enum ScreenType {
  web,
  landscape,
  phone,
}
