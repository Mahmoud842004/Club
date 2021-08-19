import 'dart:io';

import 'package:club/models/screendata.dart';
import 'package:club/models/users.dart';
import 'package:club/services/firestore.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/widgets/app_circular_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ActionButton extends StatefulWidget {
  ActionButton({
    required this.user,
    required this.filetype,
    required this.file,
    required this.content,
    required this.videoduration,
    required this.screendata,
  });

  final Users? user;
  final String filetype;
  final File file;
  final String content;
  final int? videoduration;
  final ScreenData screendata;

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => FireStore().addstory(
        user: widget.user!,
        file: widget.file,
        filetype: widget.filetype,
        content: widget.content,
        setstate: (loading) {
          if (mounted) {
            setState(() {
              isloading = loading;
            });
          }
        },
        context: context,
        videotime: widget.videoduration,
      ),
      icon: isloading
          ? AppCircularIndicator(color: theme['black']!)
          : Icon(
              ResponsiveAddaptive.isios()
                  ? CupertinoIcons.paperplane_fill
                  : Icons.send,
              color: theme['black'],
            ),
    );
  }
}
