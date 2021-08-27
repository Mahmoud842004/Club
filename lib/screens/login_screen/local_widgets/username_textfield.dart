import 'package:club/models/auth_type.dart';
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
    if (authtype == AuthType.signin) {
      return LoginTextField(
        password: false,
        validator: (value) {
          if (value!.trim().length == 0) {
            return 'The user name mustn,t be nothing';
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
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
