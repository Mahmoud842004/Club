import 'dart:async';
import 'package:club/models/screendata.dart';
import 'package:club/models/story.dart';
import 'package:flutter/material.dart';

class CurrentStoryLine extends StatefulWidget {
  CurrentStoryLine({
    required this.screendata,
    required this.changecurrentstory,
    required this.storieslist,
    required this.currentstory,
    required this.controller,
    required this.userindex,
    required this.userslist,
    required this.currentuserid,
    required this.currentuser,
  });
  final ScreenData screendata;
  final Function(Story) changecurrentstory;
  final List storieslist;
  final Story currentstory;
  final PageController? controller;
  final int? userindex;
  final List<Map<String, dynamic>>? userslist;
  final String currentuserid;
  final bool currentuser;

  @override
  _CurrentStoryLineState createState() => _CurrentStoryLineState();
}

class _CurrentStoryLineState extends State<CurrentStoryLine> {
  int passedsecounds = 0;
  @override
  void initState() {
    // FireStore().markstoryaswatched(
    //   widget.currentstory.id,
    //   widget.currentuserid,
    //   context,
    //   widget.currentuser,
    // );
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        if (passedsecounds == 10) {
          if (widget.storieslist.indexOf(widget.currentstory) ==
              widget.storieslist.length - 1) {
            if (widget.currentuser) {
              Navigator.pop(context);
            } else {
              if (widget.userindex == widget.userslist!.length - 1) {
                Navigator.pop(context);
              } else {
                widget.controller!.nextPage(
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
              }
            }
          } else {
            widget.changecurrentstory(widget.storieslist[
                widget.storieslist.indexOf(widget.currentstory) + 1]);
          }
        } else {
          setState(() {
            passedsecounds = passedsecounds + 1;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(
          horizontal: widget.screendata.screensize.width * 0.005,
        ),
        height: widget.screendata.screensize.height * 0.005,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
        ),
        duration: Duration(milliseconds: 500),
        child: LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
          backgroundColor: Colors.grey,
          value: passedsecounds / 10,
        ),
      ),
    );
  }
}
