import 'package:club/models/auth_type.dart';
import 'package:club/models/screendata.dart';
import 'package:club/screens/login_screen/local_widgets/login_textfield.dart';
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
          : screendata.screentype==ScreenType.landscape?screendata.screensize.height * 0.22:screendata.screensize.height * 0.14,
      duration: Duration(milliseconds: 80),
      child: LoginTextField(
        validator: (value) {
          if (value!.split('').length < 4) {
            return 'This username is too short';
          }
          return null;
        },
        text: 'username',
        authType: authtype,
        focusNode: node,
        controller: controller,
        hinttext: 'username hint text',
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
