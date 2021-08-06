import 'package:club/services/auth.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';

class GoogleSigninButton extends StatefulWidget {
  @override
  _GoogleSigninButtonState createState() => _GoogleSigninButtonState();
}

class _GoogleSigninButtonState extends State<GoogleSigninButton> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    final bool isweb = ResponsiveAddaptive.isweb();
    return SignInButtonBuilder(
      icon: isloading ? FontAwesomeIcons.spinner : FontAwesomeIcons.google,
      iconColor: theme['white'],
      mini: isweb?false:true,
      backgroundColor: theme['black'],
      onPressed: () => Auth().googlesigninfunction(context, (loading) {
        setState(() {
          isloading = loading;
        });
      }),
      text: isweb ? 'Sign in with google' : '',
    );
  }
}
