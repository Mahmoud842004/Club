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
  final String username;
  final double width;
  final double height;

  const LoginButton({
    required this.authtype,
    required this.email,
    required this.password,
    required this.formkey,
    required this.username,
    required this.width,
    required this.height,
  });

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    ScreenType screentype = ResponsiveAddaptive.screendata(context).screentype;
    var landscapecondition = screentype == ScreenType.landscape ? true : false;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          child: InkWell(
            onTap: () => Auth().authfunction(
              username: widget.username,
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
                      ? widget.width * 0.1
                      : widget.width * 0.15
                  : widget.width * 0.7,
              duration: Duration(milliseconds: 250),
              decoration: BoxDecoration(
                color: theme['black'],
                borderRadius: BorderRadius.circular(40),
              ),
              height: landscapecondition
                  ? widget.height * 0.12
                  : widget.height * 0.06,
              child: isloading
                  ? Container(
                      width: landscapecondition
                          ? widget.width * 0.04
                          : widget.width * 0.055,
                      height: landscapecondition
                          ? widget.height * 0.065
                          : widget.height * 0.03,
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: theme['white'],
                        valueColor: AlwaysStoppedAnimation(theme['black']),
                      ),
                    )
                  : ResponsiveAddaptive.isios()
                      ? Icon(
                          CupertinoIcons.checkmark_alt,
                          color: theme['white'],
                        )
                      : Icon(Icons.done, color: theme['white']),
            ),
          ),
        ),
      ],
    );
  }
}
