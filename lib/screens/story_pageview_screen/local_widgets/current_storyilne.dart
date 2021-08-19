import 'dart:async';
import 'package:club/models/screendata.dart';
import 'package:club/models/story.dart';
import 'package:club/services/firestore.dart';
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
    required this.ispaused,
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
  final bool ispaused;

  @override
  _CurrentStoryLineState createState() => _CurrentStoryLineState();
}

class _CurrentStoryLineState extends State<CurrentStoryLine> {
  int passedsecounds = 0;
  late int finalpassedseconds;
  @override
  void initState() {
    print(widget.currentstory.watched);
    FireStore().markstoryaswatched(
      widget.currentstory.id,
      widget.currentuserid,
      context,
      widget.currentuser,
    );
    finalpassedseconds = widget.currentstory.videotime == null
        ? 10000
        : ((widget.currentstory.videotime! * 1000)+300).toInt();
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (mounted) {
        if (widget.ispaused == false) {
          if (passedsecounds == finalpassedseconds) {
            if (widget.storieslist.indexOf(widget.currentstory) ==
                widget.storieslist.length - 1) {
              if (widget.currentuser) {
                Navigator.pop(context);
                timer.cancel();
              } else {
                if (widget.userindex == widget.userslist!.length - 1) {
                  Navigator.pop(context);
                  timer.cancel();
                } else {
                  widget.controller!.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                  timer.cancel();
                }
              }
            } else {
              widget.changecurrentstory(widget.storieslist[
                  widget.storieslist.indexOf(widget.currentstory) + 1]);
              timer.cancel();
            }
          } else {
            if (mounted) {
              setState(() {
                passedsecounds = passedsecounds + 10;
              });
            }
          }
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: widget.screendata.screensize.width * 0.005,
        ),
        height: widget.screendata.screensize.height * 0.005,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
        ),
        child: LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
          backgroundColor: Colors.grey,
          value: passedsecounds / finalpassedseconds,
        ),
      ),
    );
  }
}
