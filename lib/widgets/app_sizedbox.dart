import 'package:flutter/material.dart';

class AppSizedbox extends StatelessWidget {
  final double height;
  final double width;

  AppSizedbox({this.height = 0.0, this.width = 0.0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          height: constraints.maxHeight * height,
          width: constraints.maxWidth * width,
        );
      },
    );
  }
}
