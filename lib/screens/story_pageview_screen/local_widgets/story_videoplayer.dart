import 'package:club/models/story.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StoryVideoPlayer extends StatefulWidget {
  final Story currentstory;
  final bool ispaused;

  StoryVideoPlayer({required this.currentstory, required this.ispaused});

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
        setState(() {});
      })
      ..setLooping(false)
      ..initialize();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.value.isInitialized) {
      return SizedBox.shrink();
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
