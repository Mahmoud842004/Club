import 'package:club/models/screendata.dart';
import 'package:club/models/story.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/providers/story_pause.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'current_storyilne.dart';

class StoriesLine extends StatefulWidget {
  StoriesLine({
    required this.storieslist,
    required this.changecurrentstory,
    required this.storieslenght,
    required this.currentstory,
    required this.userindex,
    required this.controller,
    required this.userslist,
    required this.currentuser,
  });
  final List storieslist;
  final int storieslenght;
  final Story? currentstory;
  final Function(Story newstory) changecurrentstory;
  final int? userindex;
  final PageController? controller;
  final List<Map<String, dynamic>>? userslist;
  final bool currentuser;

  @override
  _StoriesLineState createState() => _StoriesLineState();
}

class _StoriesLineState extends State<StoriesLine> {
  List loadingstorieslines(ScreenData screendata) {
    List lineswidgets = [];
    for (var i = 0; i < widget.storieslenght; i++) {
      lineswidgets.add(
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: screendata.screensize.width * 0.005,
            ),
            height: screendata.screensize.height * 0.005,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(80),
            ),
          ),
        ),
      );
    }
    return lineswidgets;
  }

  List<Widget> storieslines(String currentuserid, ScreenData screendata) {
  var  changecurrentstory = widget.changecurrentstory;
  var storieslist = widget.storieslist;
  var currentstory = widget.currentstory;
  var controller = widget.controller;
  var userindex = widget.userindex;
  var userslist=  widget.userslist;
  var currentuser = widget.currentuser;
    List<Widget> storieslines = [];
    for (var story in widget.storieslist) {
      if (widget.storieslist.indexOf(widget.currentstory) ==
          widget.storieslist.indexOf(story)) {
        storieslines.add(
          Consumer<StoryPause>(builder: (context,pauseprovider,widget) {
            return CurrentStoryLine(
              screendata: screendata,
              changecurrentstory: changecurrentstory,
              storieslist: storieslist,
              currentstory: currentstory!,
              controller: controller,
              userindex: userindex,
              userslist: userslist,
              currentuserid: currentuserid,
              currentuser: currentuser,
              ispaused: pauseprovider.ispaused,
            );
          }),
        );
      } else {
        storieslines.add(
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: screendata.screensize.width * 0.005,
              ),
              height: screendata.screensize.height * 0.005,
              decoration: BoxDecoration(
                color: widget.storieslist.indexOf(widget.currentstory) >
                        widget.storieslist.indexOf(story)
                    ? Colors.white
                    : Colors.grey,
                borderRadius: BorderRadius.circular(80),
              ),
            ),
          ),
        );
      }
    }
    return storieslines;
  }

  @override
  Widget build(BuildContext context) {
    final ScreenData screendata = ResponsiveAddaptive.screendata(context);
    User? user = Provider.of<User?>(context);
    return Positioned(
      top: screendata.screensize.height * 0.008,
      left: 0.0,
      right: 0.0,
      child: Row(
        children: [
          if (widget.currentstory == null) ...loadingstorieslines(screendata),
          if (widget.currentstory != null)
            ...storieslines(user!.uid, screendata),
        ],
      ),
    );
  }
}
