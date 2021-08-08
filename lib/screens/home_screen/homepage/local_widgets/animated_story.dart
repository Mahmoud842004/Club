import 'package:club/models/screendata.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';

class AnimatedStory extends StatefulWidget {
  @override
  _AnimatedStoryState createState() => _AnimatedStoryState();
}

class _AnimatedStoryState extends State<AnimatedStory>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: Duration(
        milliseconds: 250,
      ),
    );
    controller!.forward();
    controller!.addListener(() {
      setState(() {});
    });
    controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller!.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenData screendata = ResponsiveAddaptive.screendata(context);
    return Padding(
      padding: EdgeInsets.only(
        right: screendata.screensize.width * 0.05,
        bottom: screendata.screensize.height * 0.05,
      ),
      child: Opacity(
        opacity: controller!.value,
        child: CircleAvatar(
          radius: 33,
          backgroundColor: Colors.grey[350],
        ),
      ),
    );
  }
}
