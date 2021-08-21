import 'package:flutter/material.dart';

class StoryPause with ChangeNotifier {
  bool ispaused = false;

  void switchpause(bool newbool) {
    ispaused = newbool;
    notifyListeners();
  }
}
