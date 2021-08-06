import 'dart:async';
import 'package:club/constants.dart';
import 'package:club/models/screendata.dart';
import 'package:club/models/users.dart';
import 'package:club/screens/home_screen/homepage/local_widgets/animated_story.dart';
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
  List usersstorieslsit = [];
  bool done = false;
  @override
  void initState() {
    streamSubscription =
        FireStore(userid: widget.userprovider!.uid).folowersstream.listen(
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

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO:add the current user story
    bool landscapecheck =
        widget.screendata.screentype == ScreenType.landscape ? true : false;
    if (usersidslist == null) {
      return Container(
        padding: EdgeInsets.symmetric(
            vertical: widget.screendata.screensize.height * 0.03),
        width: widget.screendata.screensize.width,
        height: widget.screendata.screensize.height * 0.15,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return AnimatedStory();
          },
          itemCount: 10,
          separatorBuilder: (context, index) {
            return SizedBox(
              width: widget.screendata.screensize.width * 0.05,
            );
          },
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
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: usersidslist!.length,
          itemBuilder: (context, index) {
            return Builder(
              builder: (context) {
                return StoryItem(
                  userid: usersidslist![index],
                  addtolist: (Users user) {
                    setState(
                      () {
                        usersstorieslsit.add(user);
                      },
                    );
                    for (var item in usersstorieslsit) {
                      print(item.name);
                    }
                  },
                  screendata: widget.screendata,
                );
              },
            );
          },
        ),
      );
    }
  }
}
