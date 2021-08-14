import 'package:club/constants.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;

  AppTextField({required this.controller, required this.hinttext});
  Widget build(BuildContext context) {
    if (ResponsiveAddaptive.isios()) {
      return CupertinoTextField(
        controller: controller,
      );
    } else {
      return TextField(
        controller: controller,
        decoration: fielddecoration.copyWith(hintText: hinttext),
      );
    }
  }
}
