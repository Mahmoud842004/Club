import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  AppLayout({required this.child, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          child: child,
          width: constraints.maxWidth * width,
          height: constraints.maxHeight * height,
        );
      },
    );
  }
}
