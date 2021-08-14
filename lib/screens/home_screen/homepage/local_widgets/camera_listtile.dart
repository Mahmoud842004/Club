import 'package:club/constants.dart';
import 'package:club/services/camera.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraListTile extends StatelessWidget {
  final String imagesource;
  final String filetype;

  CameraListTile({required this.imagesource, required this.filetype});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Camera().pickstoryfile(context: context, imagesource: imagesource, filetype: filetype),
      child: ListTile(
        leading: Icon(
          imagesource == 'camera'
              ? ResponsiveAddaptive.isios()
                  ? CupertinoIcons.camera
                  : Icons.camera
              : ResponsiveAddaptive.isios()
                  ? CupertinoIcons.photo
                  : Icons.photo,
          color: theme['black'],
        ),
        title: Text(
          '${imagesource.tr()} (${filetype.tr()})',
          style: textstyles['small black'],
        ),
      ),
    );
  }
}
