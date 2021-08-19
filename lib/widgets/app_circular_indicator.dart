import 'package:club/constants.dart';
import 'package:flutter/material.dart';

class AppCircularIndicator extends StatelessWidget {
  final Color color;
  AppCircularIndicator({required this.color});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          width: constraints.maxHeight * 0.08,
          height: constraints.maxHeight * 0.08,
          child: CircularProgressIndicator.adaptive(
            backgroundColor: theme['grey'],
            valueColor: AlwaysStoppedAnimation(color),
          ),
        );
      },
    );
  }
}
