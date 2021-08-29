import 'package:flutter/material.dart';

class ObsureProvider with ChangeNotifier {
  bool obsure = true;

  void switchobsure(newbool) {
    obsure = newbool;
    notifyListeners();
  }
}
