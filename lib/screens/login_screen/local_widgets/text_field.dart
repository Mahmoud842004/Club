import 'package:club/constants.dart';
import 'package:club/models/auth_type.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String text;
  final String hinttext;
  final bool obscure;
  final Widget icon;
  final FocusNode focusNode;
  final TextEditingController controller;
  final AuthType authType;
  final FocusNode? nextnode;

  const LoginTextField({
    required this.text,
    required this.hinttext,
    required this.obscure,
    required this.icon,
    required this.focusNode,
    required this.controller,
    required this.authType,
    this.nextnode,
  });
  @override
  Widget build(BuildContext context) {
    var screendata = ResponsiveAddaptive.screendata(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: textstyles['login screen style'],
        ),
        TextFormField(
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
          decoration: decoration.copyWith(
            prefixIcon: icon,
            hintText: hinttext,
          ),
        ),
        SizedBox(
          height: screendata.screensize.height * 0.03,
        )
      ],
    );
  }
}
