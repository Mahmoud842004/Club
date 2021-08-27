import 'package:club/models/page.dart';
import 'package:club/providers/current_page.dart';
import 'package:club/screens/home_screen/homepage/home_page.dart';
import 'package:club/screens/home_screen/local_widgets/web_navigationbar.dart';
import 'package:club/screens/home_screen/notification_page.dart';
import 'package:club/screens/home_screen/postmaker_page.dart';
import 'package:club/screens/home_screen/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WebBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: WebNavigationBar(),
          flex: 1,
        ),
        Expanded(
          child: Consumer<CurrentPageProvider>(
            builder: (context, currentpage, widget) {
              switch (currentpage.page) {
                case CurrentPage.home:
                  return HomePage();
                case CurrentPage.add:
                  return PostMakerPage();
                case CurrentPage.notifications:
                  return NotificationPage();
                case CurrentPage.profile:
                  return ProfilePage();
              }
            },
          ),
          flex: 3,
        ),
        Expanded(
          child: Container(
            color: Colors.yellow,
          ),
          flex: 2,
        )
      ],
    );
  }
}
