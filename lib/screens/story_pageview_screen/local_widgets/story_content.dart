import 'package:club/constants.dart';
import 'package:club/models/screendata.dart';
import 'package:club/models/story.dart';
import 'package:flutter/material.dart';

class StoryContent extends StatelessWidget {
  final ScreenData screendata;
  final Story? currentstory;
  StoryContent({required this.screendata, required this.currentstory});
  @override
  Widget build(BuildContext context) {
    if (currentstory != null) {
      if (currentstory!.content =="") {
        return SizedBox.shrink();
      } else {
        return Positioned(
          height: screendata.screensize.height * 0.05,
          right: 0.0,
          left: 0.0,
          bottom: screendata.screensize.height * 0.1,
          child: Container(
            alignment: Alignment.center,
            color: Colors.black87,
            child: Text(
              currentstory!.content,
              style: textstyles['small white'],
            ),
          ),
        );
      }
    } else {
      return SizedBox.shrink();
    }
  }
}
