import 'package:club/constants.dart';
import 'package:club/models/auth_type.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/widgets/app_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginTextField extends StatelessWidget {
  final String text;
  final String hinttext;
  final bool obscure;
  final Widget icon;
  final FocusNode focusNode;
  final TextEditingController controller;
  final AuthType authType;
  final FocusNode? nextnode;
  final Function(bool)? suffixfunction;
  final String? Function(String?) validator;
  final bool password;

  const LoginTextField({
    required this.text,
    required this.hinttext,
    required this.obscure,
    required this.icon,
    required this.focusNode,
    required this.controller,
    required this.authType,
    required this.validator,
    required this.password,
    this.suffixfunction,
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
        ).tr(),
        AppTextFormField(
          suffixfunction: suffixfunction,
          validator: validator,
          focusNode: focusNode,
          obscure: obscure,
          password: password,
          controller: controller,
          nextnode: nextnode,
          hinttext: hinttext,
          icon: icon,
        ),
        SizedBox(
          height: screendata.screensize.height * 0.03,
        )
      ],
    );
  }
}
