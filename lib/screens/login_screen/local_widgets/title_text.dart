import 'package:club/constants.dart';
import 'package:club/models/auth_type.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  TitleText({required this.authtype});
  final AuthType authtype;

  @override
  Widget build(BuildContext context) {
    return Text(
      authtype == AuthType.login ? 'login' : 'sign in',
      style: GoogleFonts.merriweather(
          color: theme['black'],
          fontWeight: FontWeight.bold,
          fontSize: 40),
    ).tr();
  }
}
