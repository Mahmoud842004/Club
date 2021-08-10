import 'dart:async';
import 'package:club/models/screendata.dart';
import 'package:club/models/users.dart';
import 'package:club/screens/home_screen/homepage/local_widgets/animated_story.dart';
import 'package:club/screens/home_screen/homepage/local_widgets/story_avatar.dart';
import 'package:club/services/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryItem extends StatefulWidget {
  StoryItem({
    required this.userid,
    required this.addtolist,
    required this.screendata,
    required this.index,
    required this.usersunseenedstories,
  });
  final String userid;
  final Function(Map<String, dynamic>) addtolist;
  final ScreenData screendata;
  final int index;
  final List<Map<String,dynamic>> usersunseenedstories;

  @override
  _StoryItemState createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  late StreamSubscription streamSubscription;
  Users? user;
  bool done = false;
  @override
  void initState() {
    streamSubscription =
        FireStore(id: widget.userid).userstream.listen((event) {
      // ignore: unnecessary_null_comparison
      if (event != null) {
        if (done == false) {
          setState(() {
            user = event;
            done = true;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    streamSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return AnimatedStory();
    } else if (user!.stories.isEmpty) {
      return SizedBox.shrink();
    } else {
      User? authprovider = Provider.of<User?>(context);
      return StoryAvatar(
        user: user,
        index: widget.index,
        addtolist: widget.addtolist,
        screendata: widget.screendata,
        authprovider: authprovider,
        usersunseenedstories:widget.usersunseenedstories,
      );
    }
  }
}
