import 'package:club/constants.dart';
import 'package:club/models/screendata.dart';
import 'package:club/screens/login_screen/local_widgets/login_body.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenData screendata = ResponsiveAddaptive.screendata(context);
    return AppScaffold(
      color: theme['white'],
      body: screendata.screentype == ScreenType.web
          ? SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Club',style: textstyles['huge'],),
                    ),
                  ),
                  Expanded(
                    child: LoginBody(screendata: screendata),
                  ),
                ],
              ),
            )
          : SafeArea(
              child: LoginBody(screendata: screendata),
            ),
    );
  }
}

