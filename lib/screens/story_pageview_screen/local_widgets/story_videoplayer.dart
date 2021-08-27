import 'package:club/constants.dart';
import 'package:club/models/screendata.dart';
import 'package:club/models/story.dart';
import 'package:club/providers/story_pause.dart';
import 'package:club/widgets/app_circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class StoryVideoPlayer extends StatefulWidget {
  final Story currentstory;
  final ScreenData screendata;

  StoryVideoPlayer({
    required this.currentstory,
    required this.screendata,
  });

  @override
  _StoryVideoPlayerState createState() => _StoryVideoPlayerState();
}

class _StoryVideoPlayerState extends State<StoryVideoPlayer>
    with WidgetsBindingObserver {
  late VideoPlayerController controller;
  @override
  void initState() {
    controller = VideoPlayerController.network(
      widget.currentstory.videourl.toString(),
    )
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      })
      ..setLooping(false)
      ..initialize().then(
        (value) =>
            Provider.of<StoryPause>(context, listen: false).switchpause(false),
      );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //TODO: fix app life cycle state in video playing
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached && controller.value.isInitialized) {
      Provider.of<StoryPause>(context,listen: false).switchpause(true);
    } else if (state == AppLifecycleState.resumed &&
        controller.value.isInitialized) {
      Provider.of<StoryPause>(context,listen: false).switchpause(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: fixing pauses of video put line not pause due to internet connection
    var pauseprovider = Provider.of<StoryPause>(context);
    if (controller.value.isInitialized == false) {
      return Container(
        width: widget.screendata.screensize.width * 0.07,
        height: widget.screendata.screensize.height * 0.035,
        child: AppCircularIndicator(color: theme['black']!),
      );
    } else {
      if (pauseprovider.ispaused) {
        controller.pause();
      } else {
        controller.play();
      }
      return VideoPlayer(controller);
    }
  }
}
