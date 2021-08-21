import 'package:club/constants.dart';
import 'package:club/models/screendata.dart';
import 'package:club/models/story.dart';
import 'package:club/screens/story_pageview_screen/local_widgets/story_videoplayer.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/widgets/app_circular_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageOrVideo extends StatelessWidget {
  final bool haserror;
  final Story? currentstory;

  ImageOrVideo({
    required this.haserror,
    required this.currentstory,
  });

  StoryVideoPlayer storyvideoplayer(ScreenData screendata) {
    return StoryVideoPlayer(
      screendata: screendata,
      currentstory: currentstory!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScreenData screendata = ResponsiveAddaptive.screendata(context);
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
                  child: AppCircularIndicator(color: theme['black']!),
                )
              : currentstory!.imageurl != null
                  ? Image.network(
                      currentstory!.imageurl.toString(),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                    )
                  : Align(
                      alignment: Alignment.center,
                      child: storyvideoplayer(screendata),
                    ),
    );
  }
}
