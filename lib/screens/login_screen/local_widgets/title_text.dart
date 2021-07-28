import 'package:club/constants.dart';
import 'package:club/models/auth_type.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  TitleText({required this.authtype});
  final AuthType authtype;

  @override
  Widget build(BuildContext context) {
    return Text(authtype==AuthType.login?'Login':'Sign in',style: textstyles['login title'],);
  }
}
