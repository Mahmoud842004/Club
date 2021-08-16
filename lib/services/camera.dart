import 'dart:io';
import 'package:club/screens/confirm_story_screen/confirm_story_screen.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camera {
  Future<void> pickstoryfile({
    required BuildContext context,
    required String imagesource,
    required String filetype,
  }) async {
    XFile? file;
    if (imagesource == 'camera' && filetype == 'photo') {
      file = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 300,
        imageQuality: 100,
      );
    } else if (imagesource == 'camera' && filetype == 'video') {
      file = await ImagePicker().pickVideo(
        source: ImageSource.camera,
        maxDuration: Duration(
          seconds: 10,
        ),
      );
    } else if (imagesource == 'gallery' && filetype == 'photo') {
      file = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 300,
        imageQuality: 100,
      );
    } else {
      file = await ImagePicker().pickVideo(
        source: ImageSource.gallery,
        maxDuration: Duration(
          seconds: 10,
        ),
      );
    }
    if (file != null) {
      ResponsiveAddaptive.pushnavigate(
        context: context,
        screen: ConfirmStoryScreen(
          filetype: filetype,
          file: File(file.path),
        ),
      );
    }
  }
}
