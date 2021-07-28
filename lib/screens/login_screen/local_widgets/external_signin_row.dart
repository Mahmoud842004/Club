import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants.dart';

class ExternalSigninRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SignInButtonBuilder(
          backgroundColor: theme['black'],
          mini: true,
          icon: FontAwesomeIcons.google,
          iconColor: theme['white'],
          onPressed: () {},
          text: '',
        ),
        SignInButtonBuilder(
          backgroundColor: Colors.blue,
          mini: true,
          icon: FontAwesomeIcons.facebook,
          iconColor: theme['white'],
          onPressed: () {},
          text: '',
        ),
      ],
    );
  }
}
