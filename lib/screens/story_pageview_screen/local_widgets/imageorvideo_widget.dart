import 'package:club/models/story.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageOrVideo extends StatelessWidget {
  final bool haserror;
  final Story? currentstory;
  final Function(Story) changecurrentstory;

  ImageOrVideo({
    required this.haserror,
    required this.currentstory,
    required this.changecurrentstory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey[800],
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
              : Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.image),
                ),
    );
  }
}
