import 'package:club/models/auth_type.dart';
import 'package:club/models/screendata.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class LoginButton extends StatelessWidget {
  final AuthType authtype;

  const LoginButton({required this.authtype});

  @override
  Widget build(BuildContext context) {
    var screendata = ResponsiveAddaptive.screendata(context);
    return InkWell(
      child: Container(
        height: screendata.screentype == ScreenType.landscape &&
                authtype == AuthType.login
            ? screendata.screensize.height * 0.1
            : screendata.screentype == ScreenType.landscape &&
                    authtype == AuthType.signin
                ? screendata.screensize.height * 0.042
                : screendata.screensize.height * 0.05,
        width: screendata.screensize.width * 0.4,
        decoration: BoxDecoration(
          color: theme['black'],
          borderRadius: BorderRadius.circular(40),
        ),
        child: ResponsiveAddaptive.isios()
            ? Icon(
                CupertinoIcons.checkmark_alt,
                color: theme['white'],
                size: screendata.screentype == ScreenType.landscape ? 15 : 24,
              )
            : Icon(
                Icons.done,
                color: theme['white'],
                size: screendata.screentype == ScreenType.landscape ? 15 : 24,
              ),
      ),
    );
  }
}
