import 'package:club/models/auth_type.dart';
import 'package:club/models/screendata.dart';
import 'package:club/services/auth.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class LoginButton extends StatelessWidget {
  final AuthType authtype;
  final GlobalKey<FormState> formkey;
  final String email;
  final String password;
  final String? username;

  const LoginButton({
    required this.authtype,
    required this.email,
    required this.password,
    required this.formkey,
    this.username,
  });

  @override
  Widget build(BuildContext context) {
    var screendata = ResponsiveAddaptive.screendata(context);
    return InkWell(
      onTap: () => Auth().authfunction(
        formkey: formkey,
        authType: authtype,
        email: email,
        password: password,
        username: username,
        context: context,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: theme['black'],
          borderRadius: BorderRadius.circular(40),
        ),
        height: screendata.screentype==ScreenType.landscape?screendata.screensize.height * 0.12:screendata.screensize.height * 0.06,
        child: ResponsiveAddaptive.isios()
            ? Icon(CupertinoIcons.checkmark_alt, color: theme['white'])
            : Icon(Icons.done, color: theme['white']),
      ),
    );
  }
}
