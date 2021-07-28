import 'package:club/constants.dart';
import 'package:club/models/auth_type.dart';
import 'package:club/models/screendata.dart';
import 'package:club/screens/login_screen/local_widgets/external_signin_row.dart';
import 'package:club/screens/login_screen/local_widgets/login_button.dart';
import 'package:club/screens/login_screen/local_widgets/text_field.dart';
import 'package:club/screens/login_screen/local_widgets/title_text.dart';
import 'package:club/screens/login_screen/local_widgets/username_textfield.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  final ScreenData screendata;

  const LoginBody({required this.screendata});

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  AuthType authtype = AuthType.signin;
  FocusNode emailnode = FocusNode();
  FocusNode passwordnode = FocusNode();
  FocusNode usernamenode = FocusNode();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailnode.dispose();
    passwordnode.dispose();
    usernamenode.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    usernamecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screendata = ResponsiveAddaptive.screendata(context);
    return SingleChildScrollView(
      child: Form(
        child: Container(
          width: screendata.screensize.width,
          height: screendata.screensize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleText(authtype: authtype),
              LoginTextField(
                nextnode: passwordnode,
                text: 'Email',
                authType: authtype,
                focusNode: emailnode,
                controller: emailcontroller,
                hinttext: 'Enter your email',
                obscure: false,
                icon: ResponsiveAddaptive.isios()
                    ? Icon(
                        CupertinoIcons.mail,
                        color: Colors.grey[400],
                      )
                    : Icon(
                        Icons.email,
                        color: Colors.grey[400],
                      ),
              ),
              LoginTextField(
                nextnode: authtype == AuthType.login ? null : usernamenode,
                text: 'Password',
                authType: authtype,
                focusNode: passwordnode,
                controller: passwordcontroller,
                hinttext: 'Enter your Password',
                obscure: true,
                icon: ResponsiveAddaptive.isios()
                    ? Icon(
                        CupertinoIcons.lock_fill,
                        color: Colors.grey[400],
                      )
                    : Icon(
                        Icons.lock,
                        color: Colors.grey[400],
                      ),
              ),
              UsernameTextField(
                authtype: authtype,
                node: usernamenode,
                controller: usernamecontroller,
              ),
              LoginButton(authtype: authtype),
              SizedBox(
                height: screendata.screensize.height * 0.04,
              ),
              ExternalSigninRow(),
              SizedBox(
                height: screendata.screensize.height * 0.05,
              ),
              InkWell(
                onTap: () {
                  if (authtype == AuthType.login) {
                    setState(() {
                      authtype = AuthType.signin;
                    });
                  } else {
                    setState(() {
                      authtype = AuthType.login;
                    });
                  }
                },
                child: Text(
                  authtype == AuthType.login
                      ? 'Create an account'
                      : 'I aready have an account',
                  style: TextStyle(color: theme['violet']),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
