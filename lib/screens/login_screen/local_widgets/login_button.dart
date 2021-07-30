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
    var landscapecondition = screendata.screentype==ScreenType.landscape?true:false;
    return InkWell(
      child: Container(
        height:landscapecondition?screendata.screensize.height * 0.1:screendata.screensize.height * 0.05,
        decoration: BoxDecoration(
          color: theme['black'],
          borderRadius: BorderRadius.circular(40),
        ),
        child: ResponsiveAddaptive.isios()
            ? Icon(
                CupertinoIcons.checkmark_alt,
                color: theme['white'],
                size: 24,
              )
            : Icon(
                Icons.done,
                color: theme['white'],
                size: 24,
              ),
      ),
    );
  }
}
