import 'package:club/main.dart';
import 'package:club/models/auth_type.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/widgets/app_snackbar.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'firestore.dart';

class Auth {
  var _auth = FirebaseAuth.instance;
  User? getcurrentuser() {
    return _auth.currentUser;
  }

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

  Future _signin({
    required String email,
    required String password,
    required String? username,
  }) async {
    var user = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await FireStore()
        .adduser(username: username.toString(), userid: user.user!.uid);
  }

  Future _login({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

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

}
