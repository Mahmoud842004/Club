import 'package:club/main.dart';
import 'package:club/models/auth_type.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/widgets/app_snackbar.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firestore.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class Auth {
  var _auth = FirebaseAuth.instance;
  GoogleSignIn _googlesignin = GoogleSignIn();
  FacebookLogin _facebookLogin = FacebookLogin();

  User? getcurrentuser() {
    return _auth.currentUser;
  }

  // function to login or signin in the app

  Future authfunction({
    required AuthType authType,
    required String email,
    required String password,
    required GlobalKey<FormState> formkey,
    required BuildContext context,
    required void Function(bool) setstate,
    String? username,
  }) async {
    try {
      if (formkey.currentState!.validate()) {
        ConnectivityResult result = await Connectivity().checkConnectivity();
        if (result != ConnectivityResult.none) {
          setstate(true);
          if (authType == AuthType.signin) {
            await _signin(email: email, password: password, username: username);
          } else {
            await _login(email: email, password: password);
          }
          Navigator.of(context).pushReplacement(
            ResponsiveAddaptive.isios()
                ? CupertinoPageRoute(
                    builder: (context) {
                      return MyApp();
                    },
                  )
                : MaterialPageRoute(
                    builder: (context) {
                      return MyApp();
                    },
                  ),
          );
          setstate(false);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(showsnackbar('There is no internet connection'));
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(showsnackbar(e.toString()));
      setstate(false);
    }
  }
  // signin fucntion

  Future _signin({
    required String email,
    required String password,
    required String? username,
  }) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await FireStore()
        .adduser(username: username.toString(), userid: user.user!.uid);
  }
  // login function

  Future _login({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  //sign out function

  Future signout(BuildContext context) async {
    try {
      ConnectivityResult result = await Connectivity().checkConnectivity();
      if (result != ConnectivityResult.none) {
        await _auth.signOut();
        var isios = ResponsiveAddaptive.isios();
        Navigator.of(context).pushAndRemoveUntil(
            isios
                ? CupertinoPageRoute(
                    builder: (context) {
                      return MyApp();
                    },
                  )
                : MaterialPageRoute(
                    builder: (context) {
                      return MyApp();
                    },
                  ),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(showsnackbar('There is no internet connection'));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(showsnackbar(e.toString()));
    }
  }

  //function to signin with google

  Future googlesigninfunction(
      BuildContext context, void Function(bool) setstate) async {
    try {
      final connection = await Connectivity().checkConnectivity();
      if (connection != ConnectivityResult.none) {
        setstate(true);
        final GoogleSignInAccount? googleSignInAccount =
            await _googlesignin.signIn();
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final result = await _auth.signInWithCredential(credential);
        await FireStore().adduser(
          username: result.user!.displayName.toString(),
          userid: result.user!.uid,
          imageurl: result.user!.photoURL,
        );
        Navigator.of(context).pushReplacement(
          ResponsiveAddaptive.isios()
              ? CupertinoPageRoute(
                  builder: (context) {
                    return MyApp();
                  },
                )
              : MaterialPageRoute(
                  builder: (context) {
                    return MyApp();
                  },
                ),
        );
        setstate(false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(showsnackbar('There is no internet connection'));
        setstate(false);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(showsnackbar(e.toString()));
      setstate(false);
    }
  }

  Future facebooksignin(context, void Function(bool) setstate) async {
    try {
      final ConnectivityResult result =
          await Connectivity().checkConnectivity();
      if (result != ConnectivityResult.none) {
        setstate(true);
        FacebookLoginResult res = await _facebookLogin.logIn();
        switch (res.status) {
          case FacebookLoginStatus.cancel:
            break;
          case FacebookLoginStatus.error:
            print(res.error);
            ScaffoldMessenger.of(context)
                .showSnackBar(showsnackbar('There is an error'));
            setstate(false);
            break;
          case FacebookLoginStatus.success:
            FacebookAccessToken? token = res.accessToken;
            AuthCredential credential =
                FacebookAuthProvider.credential(token!.token);
            var user = await _auth.signInWithCredential(credential);
            await FireStore().adduser(
              username: user.user!.displayName.toString(),
              userid: user.user!.uid,
              imageurl: user.user!.photoURL,
            );
            setstate(false);
            Navigator.of(context).pushReplacement(
              ResponsiveAddaptive.isios()
                  ? CupertinoPageRoute(
                      builder: (context) {
                        return MyApp();
                      },
                    )
                  : MaterialPageRoute(
                      builder: (context) {
                        return MyApp();
                      },
                    ),
            );
            break;
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(showsnackbar('There is no internet connection'));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(showsnackbar(e.toString()));
    }
  }
}
