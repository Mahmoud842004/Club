import 'package:club/constants.dart';
import 'package:flutter/material.dart';

class AppCircularIndicator extends StatelessWidget {
  final Color color;
  AppCircularIndicator({required this.color});
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      backgroundColor: theme['grey'],
      valueColor: AlwaysStoppedAnimation(color),
    );
  }
}
