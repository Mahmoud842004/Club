import 'package:club/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class StoryText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'stories',
      style: textstyles['small'],
    ).tr();
  }
}
