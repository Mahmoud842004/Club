import 'package:club/models/auth_type.dart';
import 'package:club/models/screendata.dart';
import 'package:club/screens/login_screen/local_widgets/external_signin_row.dart';
import 'package:club/screens/login_screen/local_widgets/login_button.dart';
import 'package:club/screens/login_screen/local_widgets/switchtext.dart';
import 'package:club/screens/login_screen/local_widgets/login_textfield.dart';
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
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
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

  void editusernamewhilelogin() {
    if (authtype == AuthType.login) {
      usernamecontroller.text = '******';
    }
  }

  @override
  Widget build(BuildContext context) {
    var screendata = ResponsiveAddaptive.screendata(context);
    var landscapecondition =
        screendata.screentype == ScreenType.landscape ? true : false;
    editusernamewhilelogin();
    return Form(
      key: formkey,
      child: ListView(
        padding: EdgeInsets.only(
          top: screendata.screensize.height * 0.15,
          left: screendata.screensize.width * 0.04,
          right: screendata.screensize.width * 0.04,
        ),
        children: [
          Align(
            child: TitleText(authtype: authtype),
            alignment: Alignment.topCenter,
          ),
          LoginTextField(
            validator: (value) {
              if (value!.contains('@') && value.endsWith('.com')) {
                return null;
              }
              return 'This email is badly formated';
            },
            nextnode: passwordnode,
            text: 'email',
            authType: authtype,
            focusNode: emailnode,
            controller: emailcontroller,
            hinttext: 'email hint text',
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
            validator: (value) {
              if (value!.split('').length < 4) {
                return 'This passowrd is too short';
              }
              return null;
            },
            nextnode: authtype == AuthType.login ? null : usernamenode,
            text: 'password',
            authType: authtype,
            focusNode: passwordnode,
            controller: passwordcontroller,
            hinttext: 'password hint text',
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
          SizedBox(
            height: landscapecondition
                ? screendata.screensize.height * 0.05
                : screendata.screensize.height * 0.02,
          ),
          LoginButton(
            authtype: authtype,
            formkey: formkey,
            email: emailcontroller.text,
            password: passwordcontroller.text,
            username: usernamecontroller.text,
          ),
          SizedBox(
            height: landscapecondition
                ? screendata.screensize.height * 0.1
                : screendata.screensize.height * 0.04,
          ),
          ExternalSigninRow(),
          SizedBox(
              height: landscapecondition
                  ? screendata.screensize.height * 0.08
                  : screendata.screensize.height * 0.04),
          SwitchText(
            authtype: authtype,
            setstate: (newauthtype) {
              setState(
                () {
                  authtype = newauthtype;
                  emailcontroller = TextEditingController();
                  passwordcontroller = TextEditingController();
                  usernamecontroller = TextEditingController();
                },
              );
            },
          ),
          SizedBox(height: screendata.screensize.height*0.1),
        ],
      ),
    );
  }
}
