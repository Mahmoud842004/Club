import 'dart:async';
import 'package:club/screens/story_pageview_screen/story_page.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'story_widget.dart';
import 'package:club/models/screendata.dart';
import 'package:club/models/story.dart';
import 'package:club/models/users.dart';
import 'package:club/screens/home_screen/homepage/local_widgets/animated_story.dart';
import 'package:club/services/firestore.dart';
import 'package:flutter/material.dart';

class CurrentUserStoryAvatar extends StatefulWidget {
  CurrentUserStoryAvatar({required this.user, required this.screendata});

  final Users user;
  final ScreenData screendata;

  @override
  _CurrentUserStoryAvatarState createState() => _CurrentUserStoryAvatarState();
}

class _CurrentUserStoryAvatarState extends State<CurrentUserStoryAvatar> {
  late StreamSubscription streamSubscription;
  Story? story;
  @override
  void initState() {
    //TODO:check case when adding a story while the last story is watched
    streamSubscription =
        FireStore(id: widget.user.stories.last).storystream.listen((event) {
      // ignore: unnecessary_null_comparison
      if (event != null) {
        if (mounted) {
          setState(() {
            story = event;
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
    if (story == null) {
      return AnimatedStory();
    } else {
      return StoryWidget.currentuser(
        user: widget.user,
        screendata: widget.screendata,
        ontap: () {
          ResponsiveAddaptive.pushnavigate(
            context: context,
            screen: StoryPage.currentuser(
              user: widget.user,
            ),
          );
        },
        laststory: story,
      );
    }
  }
}
