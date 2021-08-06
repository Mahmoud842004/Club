import 'dart:async';
import 'package:club/constants.dart';
import 'package:club/models/screendata.dart';
import 'package:club/models/users.dart';
import 'package:club/screens/home_screen/homepage/local_widgets/animated_story.dart';
import 'package:club/services/firestore.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryItem extends StatefulWidget {
  StoryItem(
      {required this.userid,
      required this.addtolist,
      required this.screendata});
  final String userid;
  final Function(Users user) addtolist;
  final ScreenData screendata;

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
        FireStore(userid: widget.userid).userstream.listen((event) {
      // ignore: unnecessary_null_comparison
      if (event != null) {
        if (done == false) {
          setState(() {
            user = event;
            done = true;
          });
          if (user!.stories.isEmpty == false) {
            widget.addtolist(user!);
          }
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
      bool hasprofileimage = user!.profileimage != null ? true : false;
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.pink,
                  width: 3,
                )),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: hasprofileimage ? null : Colors.grey[400],
              backgroundImage: hasprofileimage
                  ? NetworkImage(
                      user!.profileimage.toString(),
                    )
                  : null,
              child: hasprofileimage
                  ? null
                  : Icon(
                      ResponsiveAddaptive.isios()
                          ? CupertinoIcons.person
                          : Icons.person,
                      color: theme['black'],
                    ),
            ),
          ),
          SizedBox(height: widget.screendata.screensize.height * 0.01),
          Text(user!.name, style: textstyles['very small'])
        ],
      );
    }
  }
}
