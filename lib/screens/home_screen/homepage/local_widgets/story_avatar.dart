import 'dart:async';
import 'package:club/models/screendata.dart';
import 'package:club/models/users.dart';
import 'package:club/screens/home_screen/homepage/local_widgets/animated_story.dart';
import 'package:club/screens/story_pageview_screen/story_pageview_screen.dart';
import 'package:club/services/firestore.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'story_widget.dart';

class StoryAvatar extends StatefulWidget {
  StoryAvatar({
    required this.user,
    required this.addtolist,
    required this.index,
    required this.screendata,
    required this.authprovider,
    required this.usersunseenedstories,
  });
  final Users? user;
  final Function(Map<String, dynamic>) addtolist;
  final int index;
  final ScreenData screendata;
  final User? authprovider;
  final List<Map<String, dynamic>> usersunseenedstories;
  @override
  _StoryAvatarState createState() => _StoryAvatarState();
}

class _StoryAvatarState extends State<StoryAvatar> {
  late StreamSubscription streamSubscription;
  bool? iswatched;
  @override
  void initState() {
    streamSubscription = FireStore(id: widget.user!.stories.last)
        .storywatchestream
        .listen((event) {
      if (event != null) {
        for (var item in event) {
          if (item.toString().trim() == widget.authprovider!.uid.toString()) {
            if (mounted) {
              setState(() {
                iswatched = true;
              });
            }
          }
        }
        if (iswatched == null) {
          setState(() {
            iswatched = false;
          });
          widget.addtolist(
            {
              'user': widget.user,
              'index': widget.index,
            },
          );
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
    if (iswatched == null) {
      return AnimatedStory();
    } else if (iswatched == true) {
      return SizedBox.shrink();
    } else {
      return StoryWidget(
        user: widget.user!,
        screendata: widget.screendata,
        ontap: () {
          ResponsiveAddaptive.pushnavigate(
            context: context,
            screen: StoryPageViewScreen(
              usersunseenedstories: widget.usersunseenedstories,
              clickedindex: widget.index,
            ),
          );
        },
      );
    }
  }
}
