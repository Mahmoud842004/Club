import 'package:club/models/story.dart';
import 'package:flutter/material.dart';

class RightAndLeft extends StatelessWidget {
  RightAndLeft({
    required this.changestory,
    required this.controller,
    required this.currentstory,
    required this.index,
    required this.userslist,
    required this.currentuser,
    required this.storieslist,
  });
  final Function(Story) changestory;
  final PageController? controller;
  final Story? currentstory;
  final int? index;
  final List? userslist;
  final bool currentuser;
  final List storieslist;

  void ontapright(BuildContext context) {
    print('tap right');
    if (currentstory != null) {
      if (storieslist.indexOf(currentstory) == storieslist.length - 1) {
        if (currentuser) {
          Navigator.pop(context);
        } else {
          if (index == userslist!.length - 1) {
            Navigator.pop(context);
          } else {
            controller!.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }
        }
      } else {
        changestory(
          storieslist[storieslist.indexOf(currentstory) + 1],
        );
      }
    }
  }

  void ontapleft(BuildContext context) {
    print('tab left');
    if (currentstory != null) {
      if (storieslist.indexOf(currentstory) == 0) {
        if (currentuser) {
          Navigator.pop(context);
        } else {
          if (index == 0) {
            Navigator.pop(context);
          } else {
            controller!.previousPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          }
        }
      } else {
        changestory(
          storieslist[storieslist.indexOf(currentstory) - 1],
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => ontapleft(context),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => ontapright(context),
            ),
          ),
        ],
      ),
    );
  }
}
