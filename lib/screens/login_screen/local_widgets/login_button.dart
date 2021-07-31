import 'package:club/models/auth_type.dart';
import 'package:club/models/screendata.dart';
import 'package:club/services/auth.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class LoginButton extends StatefulWidget {
  final AuthType authtype;
  final GlobalKey<FormState> formkey;
  final String email;
  final String password;
  final String? username;

  const LoginButton({
    required this.authtype,
    required this.email,
    required this.password,
    required this.formkey,
    this.username,
  });

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    var screendata = ResponsiveAddaptive.screendata(context);
    var landscapecondition =
        screendata.screentype == ScreenType.landscape ? true : false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          child: InkWell(
            onTap: () => Auth().authfunction(
              authType: widget.authtype,
              email: widget.email,
              password: widget.password,
              formkey: widget.formkey,
              context: context,
              setstate: (loading) {
                setState(() {
                  isloading = loading;
                });
              },
            ),
            child: AnimatedContainer(
              alignment: Alignment.center,
              width: isloading
                  ? landscapecondition
                      ? screendata.screensize.width * 0.1
                      : screendata.screensize.width * 0.15
                  : screendata.screensize.width * 0.7,
              duration: Duration(milliseconds: 250),
              decoration: BoxDecoration(
                color: theme['black'],
                borderRadius: BorderRadius.circular(40),
              ),
              height: screendata.screentype == ScreenType.landscape
                  ? screendata.screensize.height * 0.12
                  : screendata.screensize.height * 0.06,
              child: isloading
                  ? Container(
                      width: landscapecondition
                          ? screendata.screensize.width * 0.04
                          : screendata.screensize.width * 0.055,
                      height: landscapecondition
                          ? screendata.screensize.height * 0.065
                          : screendata.screensize.height * 0.03,
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: theme['white'],
                        valueColor: AlwaysStoppedAnimation(theme['black']),
                      ),
                    )
                  : ResponsiveAddaptive.isios()
                      ? Icon(CupertinoIcons.checkmark_alt,
                          color: theme['white'])
                      : Icon(Icons.done, color: theme['white']),
            ),
          ),
        ),
      ],
    );
  }
}
