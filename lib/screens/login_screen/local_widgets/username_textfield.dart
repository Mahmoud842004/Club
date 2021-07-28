import 'package:club/models/auth_type.dart';
import 'package:club/screens/login_screen/local_widgets/text_field.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsernameTextField extends StatelessWidget {
  final AuthType authtype;
  final FocusNode node;
  final TextEditingController controller;

  UsernameTextField(
      {required this.authtype, required this.node, required this.controller});
  @override
  Widget build(BuildContext context) {
    var screendata = ResponsiveAddaptive.screendata(context);
    return AnimatedContainer(
      height: authtype == AuthType.login
          ? 0.0
          : screendata.screensize.height * 0.122,
      duration: Duration(milliseconds: 80),
      child: LoginTextField(
        text: 'Username',
        authType: authtype,
        focusNode: node,
        controller: controller,
        hinttext: 'Enter your username',
        obscure: false,
        icon: ResponsiveAddaptive.isios()
            ? Icon(
                CupertinoIcons.person,
                color: Colors.grey[400],
              )
            : Icon(
                Icons.person,
                color: Colors.grey[400],
              ),
      ),
    );
  }
}
