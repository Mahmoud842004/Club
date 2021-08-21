import 'package:club/screens/home_screen/homepage/home_page.dart';
import 'package:club/screens/home_screen/notification_page.dart';
import 'package:club/screens/home_screen/postmaker_page.dart';
import 'package:club/screens/home_screen/profilepage.dart';
import 'package:club/screens/home_screen/search_page.dart';
import 'package:flutter/material.dart';

class PhoneBody extends StatelessWidget {

  final TabController controller;
  PhoneBody({required this.controller});
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
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
