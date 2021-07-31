import 'package:club/screens/login_screen/local_widgets/facebooksigninbutton.dart';
import 'package:club/screens/login_screen/local_widgets/googlesigninbutton.dart';
import 'package:flutter/material.dart';

class ExternalSigninRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        GoogleSigninButton(),
        FacebookSigninButton(),
      ],
    );
  }
}
