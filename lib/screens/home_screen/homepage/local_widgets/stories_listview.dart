import 'dart:async';
import 'package:club/constants.dart';
import 'package:club/models/screendata.dart';
import 'package:club/screens/home_screen/homepage/local_widgets/animated_story.dart';
import 'package:club/screens/home_screen/homepage/local_widgets/current_user_story.dart';
import 'package:club/widgets/app_snackbar.dart';
import 'story_item.dart';
import 'package:club/services/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StoryListView extends StatefulWidget {
  StoryListView({required this.userprovider, required this.screendata});
  final User? userprovider;
  final ScreenData screendata;
  @override
  _StoryListViewState createState() => _StoryListViewState();
}

class _StoryListViewState extends State<StoryListView> {
  List? usersidslist;
  late StreamSubscription streamSubscription;
  List<Map<String, dynamic>> usersunseenedstories = [];
  bool done = false;
  @override
  void initState() {
    streamSubscription =
        FireStore(id: widget.userprovider!.uid).followingstream.listen(
      (event) {
        // ignore: unnecessary_null_comparison
        if (event != null) {
          if (done == false) {
            setState(() {
              usersidslist = event;
              done = true;
            });
          }
        }
      },
      onError: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          showsnackbar(
            error.toString(),
          ),
        );
      },
    );
    super.initState();
  }

  List<Widget> returnstoryitemslist() {
    List<Widget> widgetslist = [];

    for (var item in usersidslist!) {
      widgetslist.add(
        StoryItem(
          index: usersidslist!.indexOf(item),
          usersunseenedstories: usersunseenedstories,
          userid: item,
          addtolist: (Map<String, dynamic> storymap) {
            setState(
              () {
                usersunseenedstories.add(storymap);
              },
            );
          },
          screendata: widget.screendata,
        ),
      );
    }
    return widgetslist;
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool landscapecheck =
        widget.screendata.screentype == ScreenType.landscape ? true : false;
    if (usersidslist == null) {
      return Container(
        padding: EdgeInsets.symmetric(
            vertical: widget.screendata.screensize.height * 0.03),
        width: widget.screendata.screensize.width,
        height: widget.screendata.screensize.height * 0.15,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return AnimatedStory();
          },
          itemCount: 10,
        ),
      );
    } else if (usersidslist!.isEmpty) {
      //TODO:develop emty user list widget
      return Row(
        children: [
          Text(
            'There is no Stories',
            style: textstyles['small'],
          ),
        ],
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(
            vertical: widget.screendata.screensize.height * 0.03),
        width: widget.screendata.screensize.width,
        height: landscapecheck
            ? widget.screendata.screensize.height * 0.3
            : widget.screendata.screensize.height * 0.2,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CurrentUserStory(
              screendata: widget.screendata,
              userid: widget.userprovider!.uid,
            ),
            ...returnstoryitemslist()
          ],
        ),
      );
    }
  }
}
