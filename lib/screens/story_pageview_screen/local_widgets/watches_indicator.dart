import 'dart:async';

import 'package:club/constants.dart';
import 'package:club/models/screendata.dart';
import 'package:club/models/story.dart';
import 'package:club/services/firestore.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WatchesIndicator extends StatefulWidget {
  WatchesIndicator({required this.currentstory});

  final Story? currentstory;

  @override
  _WatchesIndicatorState createState() => _WatchesIndicatorState();
}

class _WatchesIndicatorState extends State<WatchesIndicator> {
  late StreamSubscription streamSubscription;
  List? watcheslist;

  @override
  void initState() {
    streamSubscription = FireStore(id: widget.currentstory!.id)
        .storywatchingstream
        .listen((event) {
      // ignore: unnecessary_null_comparison
      if (event != null) {
        if (mounted) {
          setState(() {
            watcheslist = event;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenData screendata = ResponsiveAddaptive.screendata(context);
    return Positioned(
      bottom: screendata.screensize.height * 0.02,
      left: screendata.screensize.width * 0.05,
      right: screendata.screensize.width * 0.05,
      child: Row(
        children: [
          Icon(
            ResponsiveAddaptive.isios()
                ? CupertinoIcons.eye_fill
                : Icons.visibility,
            color: theme['white'],
          ),
          SizedBox(width: screendata.screensize.width * 0.02),
          watcheslist == null
              ? SizedBox.shrink()
              : Text(
                  watcheslist!.length.toString(),
                  style: textstyles['small white'],
                )
        ],
      ),
    );
  }
}
