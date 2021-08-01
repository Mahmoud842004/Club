import 'package:club/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:club/constants.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FacebookSigninButton extends StatefulWidget {
  @override
  _FacebookSigninButtonState createState() => _FacebookSigninButtonState();
}

class _FacebookSigninButtonState extends State<FacebookSigninButton> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return SignInButtonBuilder(
      backgroundColor: Colors.blue,
      mini: true,
      icon: isloading ? FontAwesomeIcons.spinner : FontAwesomeIcons.facebook,
      iconColor: theme['white'],
      onPressed: () => Auth().facebooksignin(context, (loading) {
        setState(
          () {
            isloading = loading;
          },
        );
      }),
      text: '',
    );
  }
}
