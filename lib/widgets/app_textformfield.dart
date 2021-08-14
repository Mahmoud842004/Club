import 'package:club/constants.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';

class AppTextFormField extends StatelessWidget {
  final Widget icon;
  final String hinttext;
  final TextEditingController controller;
  final bool obscure;
  final FocusNode focusNode;
  final FocusNode? nextnode;
  final String? Function(String?) validator;

  AppTextFormField({
    required this.hinttext,
    required this.controller,
    required this.obscure,
    required this.icon,
    required this.focusNode,
    required this.validator,
    this.nextnode,
  });

  @override
  Widget build(BuildContext context) {
    if (ResponsiveAddaptive.isios()) {
      return CupertinoTextFormFieldRow(
        placeholder: hinttext.tr(),
        validator: (value) => validator(value),
        prefix: icon,
        onFieldSubmitted: (value) {
          if (nextnode == null) {
            FocusScope.of(context).unfocus();
          } else {
            FocusScope.of(context).requestFocus(nextnode);
          }
        },
        focusNode: focusNode,
        obscureText: obscure,
        controller: controller,
      );
    } else {
      return TextFormField(
        validator: (value) => validator(value),
        onFieldSubmitted: (value) {
          if (nextnode == null) {
            FocusScope.of(context).unfocus();
          } else {
            FocusScope.of(context).requestFocus(nextnode);
          }
        },
        focusNode: focusNode,
        obscureText: obscure,
        controller: controller,
        decoration: formfielddecoration.copyWith(
          prefixIcon: icon,
          hintText: hinttext.tr(),
        ),
      );
    }
  }
}
