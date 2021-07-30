import 'package:club/constants.dart';
import 'package:club/models/auth_type.dart';
import 'package:club/models/screendata.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/widgets/app_textfield.dart';
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
  final String? Function(String?) validator;

  const LoginTextField({
    required this.text,
    required this.hinttext,
    required this.obscure,
    required this.icon,
    required this.focusNode,
    required this.controller,
    required this.authType,
    required this.validator,
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
          validator:validator,
          focusNode: focusNode,
          obscure: obscure,
          controller: controller,
          nextnode: nextnode,
          hinttext: hinttext,
          icon: icon,
        ),
        SizedBox(
          height: screendata.screentype == ScreenType.landscape
              ? 0.0
              : screendata.screensize.height * 0.03,
        )
      ],
    );
  }
}
