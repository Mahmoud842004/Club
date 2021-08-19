import 'package:club/constants.dart';
import 'package:club/models/story.dart';
import 'package:club/widgets/app_circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StoryVideoPlayer extends StatefulWidget {
  final Story currentstory;
  final bool ispaused;
  final Function(bool) changepause;

  StoryVideoPlayer({
    required this.currentstory,
    required this.ispaused,
    required this.changepause,
  });

  @override
  _StoryVideoPlayerState createState() => _StoryVideoPlayerState();
}

class _StoryVideoPlayerState extends State<StoryVideoPlayer> {
  late VideoPlayerController controller;
  @override
  void initState() {
    controller = VideoPlayerController.network(
      widget.currentstory.videourl.toString(),
    )
      ..addListener(() {
        if (mounted) {
          setState(() {});
          if (controller.value.isPlaying && widget.ispaused) {
            widget.changepause(false);
          } else if (controller.value.isPlaying == false &&
              widget.ispaused == false) {
            widget.changepause(true);
          }
        }
      })
      ..setLooping(false)
      ..initialize().then((value) => widget.changepause(false));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: fixing pauses of video put line not pause due to internet connection
    if (controller.value.isInitialized == false) {
      return AppCircularIndicator(color: theme['black']!);
    } else {
      if (widget.ispaused) {
        controller.pause();
      } else {
        controller.play();
      }
      return VideoPlayer(controller);
    }
  }
}
