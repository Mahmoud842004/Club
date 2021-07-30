import 'package:club/constants.dart';
import 'package:club/models/auth_type.dart';
import 'package:club/models/screendata.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  TitleText({required this.authtype});
  final AuthType authtype;

  @override
  Widget build(BuildContext context) {
    var screendata = ResponsiveAddaptive.screendata(context);
    return Text(
      authtype == AuthType.login ? 'login' : 'sign in',
      style: GoogleFonts.merriweather(
          color: theme['black'],
          fontWeight: FontWeight.bold,
          fontSize: screendata.screentype == ScreenType.landscape ? 10 : 40),
    ).tr();
  }
}
