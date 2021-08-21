import 'dart:io';
import 'package:club/constants.dart';
import 'package:club/models/screendata.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ConfirmStoryVideo extends StatefulWidget {
  final File file;
  final ScreenData screendata;
  final Function(int secounds) getvideoduration;

  ConfirmStoryVideo(
      {required this.file,
      required this.screendata,
      required this.getvideoduration});
  @override
  _ConfirmStoryVideoState createState() => _ConfirmStoryVideoState();
}

class _ConfirmStoryVideoState extends State<ConfirmStoryVideo>
    with WidgetsBindingObserver {
  late VideoPlayerController controller;
  @override
  void initState() {
    controller = VideoPlayerController.file(widget.file)
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      })
      ..setLooping(false)
      ..initialize().then((value) {
        widget.getvideoduration(controller.value.duration.inSeconds);
      });
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused && controller.value.isInitialized) {
      controller.pause();
    } else if (state == AppLifecycleState.resumed &&
        controller.value.isInitialized) {
      controller.play();
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.value.isInitialized) {
      return Container(
        width: widget.screendata.screensize.width,
        height: widget.screendata.screensize.height * 0.5,
        child: Stack(
          children: [
            VideoPlayer(controller),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  if (controller.value.isPlaying) {
                    controller.pause();
                  } else {
                    controller.play();
                  }
                },
                child: CircleAvatar(
                  backgroundColor: theme['white'],
                  child: Icon(
                    controller.value.isPlaying
                        ? ResponsiveAddaptive.isios()
                            ? CupertinoIcons.pause
                            : Icons.pause
                        : ResponsiveAddaptive.isios()
                            ? CupertinoIcons.play
                            : Icons.play_arrow,
                    color: theme['black'],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.grey),
          backgroundColor: theme['black'],
        ),
      );
    }
  }
}
