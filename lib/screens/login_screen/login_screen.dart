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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                      'assets/logo.jfif',
                    ),
                  ),
                  Expanded(
                    child: LoginBody(screendata: screendata),
                    flex: 2,
                  ),
                ],
              ),
            )
          : SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screendata.screensize.width * 0.04,
                ),
                child: LoginBody(screendata: screendata),
              ),
            ),
    );
  }
}
