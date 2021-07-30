import 'package:club/constants.dart';
import 'package:club/models/auth_type.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SwitchText extends StatelessWidget {
  final Function(AuthType newauthtype) setstate;
  final AuthType authtype;
  SwitchText({required this.setstate, required this.authtype});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (authtype == AuthType.login) {
          setstate(AuthType.signin);
        } else {
          setstate(AuthType.login);
        }
      },
      child: Text(
        authtype == AuthType.login
            ? 'sign in switch text'
            : 'login switch text',
        style: TextStyle(color: theme['black']),
      ).tr(),
    );
  }
}
