import 'package:club/models/screendata.dart';
import 'package:club/models/story.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'current_storyilne.dart';

class StoriesLine extends StatefulWidget {
  StoriesLine({
    required this.storieslist,
    required this.screendata,
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
  final ScreenData screendata;
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
  List loadingstorieslines() {
    List lineswidgets = [];
    for (var i = 0; i < widget.storieslenght; i++) {
      lineswidgets.add(
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: widget.screendata.screensize.width * 0.005,
            ),
            height: widget.screendata.screensize.height * 0.005,
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

  List<Widget> storieslines(String currentuserid) {
    List<Widget> storieslines = [];
    for (var story in widget.storieslist) {
      if (widget.storieslist.indexOf(widget.currentstory) ==
          widget.storieslist.indexOf(story)) {
        storieslines.add(
          CurrentStoryLine(
            screendata: widget.screendata,
            changecurrentstory: widget.changecurrentstory,
            storieslist: widget.storieslist,
            currentstory: widget.currentstory!,
            controller: widget.controller,
            userindex: widget.userindex,
            userslist: widget.userslist,
            currentuserid: currentuserid,
            currentuser:widget.currentuser,
          ),
        );
      } else {
        storieslines.add(
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: widget.screendata.screensize.width * 0.005,
              ),
              height: widget.screendata.screensize.height * 0.005,
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
    User? user = Provider.of<User?>(context);
    return Positioned(
      top: widget.screendata.screensize.height * 0.008,
      left: 0.0,
      right: 0.0,
      child: Row(
        children: [
          if (widget.currentstory == null) ...loadingstorieslines(),
          if (widget.currentstory != null) ...storieslines(user!.uid),
        ],
      ),
    );
  }
}
