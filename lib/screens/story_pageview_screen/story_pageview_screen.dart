import 'package:club/screens/story_pageview_screen/story_page.dart';
import 'package:club/state_mangment/story_pause.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryPageViewScreen extends StatefulWidget {
  StoryPageViewScreen(
      {required this.usersunseenedstories, required this.clickedindex});

  final List<Map<String, dynamic>> usersunseenedstories;
  final int clickedindex;

  @override
  State<StoryPageViewScreen> createState() => _StoryPageViewScreenState();
}

class _StoryPageViewScreenState extends State<StoryPageViewScreen> {
  late PageController pagecontroller;
  @override
  void initState() {
    int initialpage = widget.usersunseenedstories.indexOf(
      widget.usersunseenedstories.firstWhere(
        (element) {
          if (element['index'] == widget.clickedindex) {
            return true;
          } else {
            return false;
          }
        },
      ),
    );
    pagecontroller = PageController(
      initialPage: initialpage,
    );
    super.initState();
  }

  @override
  void dispose() {
    pagecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    return PageView.builder(
      itemBuilder: (context, index) {
        return ChangeNotifierProvider<StoryPause>.value(
          value: StoryPause(),
          child: StoryPage(
            user: widget.usersunseenedstories[index]['user'],
            index: index,
            currentuserid: user!.uid,
            controller: pagecontroller,
            userslist: widget.usersunseenedstories,
          ),
        );
      },
      itemCount: widget.usersunseenedstories.length,
      controller: pagecontroller,
    );
  }
}
