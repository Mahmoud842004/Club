import 'package:club/models/page.dart';
import 'package:flutter/material.dart';

class CurrentPageProvider with ChangeNotifier {
  CurrentPage page = CurrentPage.home;

  void changepage(CurrentPage newpage) {
    page = newpage;
    notifyListeners();
  }
}
