import 'package:club/models/screendata.dart';
import 'package:club/models/story.dart';
import 'package:club/screens/story_pageview_screen/local_widgets/story_videoplayer.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageOrVideo extends StatelessWidget {
  final bool haserror;
  final Story? currentstory;
  final Function(Story) changecurrentstory;
  final bool ispaused;
  final ScreenData screendata;

  ImageOrVideo({
    required this.haserror,
    required this.currentstory,
    required this.changecurrentstory,
    required this.ispaused,
    required this.screendata,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: screendata.screensize.height * 0.2,
      bottom: screendata.screensize.height * 0.2,
      child: haserror
          ? Align(
              alignment: Alignment.center,
              child: Icon(
                ResponsiveAddaptive.isios()
                    ? CupertinoIcons.restart
                    : Icons.restart_alt,
              ),
            )
          : currentstory == null
              ? Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )
              : currentstory!.imageurl != null
                  ? Image.network(
                      currentstory!.imageurl.toString(),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                    )
                  : StoryVideoPlayer(
                      currentstory: currentstory!,
                      ispaused: ispaused,
                    ),
    );
  }
}
