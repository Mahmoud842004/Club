import 'package:club/screens/home_screen/homepage/home_page.dart';
import 'package:club/screens/home_screen/notification_page.dart';
import 'package:club/screens/home_screen/postmaker_page.dart';
import 'package:club/screens/home_screen/profilepage.dart';
import 'package:club/screens/home_screen/search_page.dart';
import 'package:flutter/material.dart';

class PhoneBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        HomePage(),
        SearchPage(),
        PostMakerPage(),
        NotificationPage(),
        ProfilePage(),
      ],
    );
  }
}
