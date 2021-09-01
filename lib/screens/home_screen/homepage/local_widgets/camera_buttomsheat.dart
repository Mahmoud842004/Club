import 'package:club/models/screendata.dart';
import 'package:club/screens/home_screen/homepage/local_widgets/camera_listtile.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraButtomSheat extends StatelessWidget {
  final BuildContext lastcontext;
  CameraButtomSheat({required this.lastcontext});
  @override
  Widget build(BuildContext context) {
    ScreenData screendata = ResponsiveAddaptive.screendata(context);
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CameraListTile(
            imagesource: 'camera',
            filetype: 'photo',
            lastcontext: lastcontext,
          ),
          SizedBox(height: screendata.screensize.height*0.01),
          CameraListTile(
            imagesource: 'camera',
            filetype: 'video',
            lastcontext: lastcontext,
          ),
          SizedBox(height: screendata.screensize.height*0.01),
          CameraListTile(
            imagesource: 'gallery',
            filetype: 'photo',
            lastcontext: lastcontext,
          ),
          SizedBox(height: screendata.screensize.height*0.01),
          CameraListTile(
            imagesource: 'gallery',
            filetype: 'video',
            lastcontext: lastcontext,
          ),
        ],
      ),
    );
  }
}
