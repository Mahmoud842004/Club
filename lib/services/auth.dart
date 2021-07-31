import 'package:club/models/auth_type.dart';
import 'package:club/screens/whole_screen.dart';
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
    String? username,
  }) async {
    try {
      if (formkey.currentState!.validate()) {
        ConnectivityResult result = await Connectivity().checkConnectivity();
        if (result != ConnectivityResult.none) {
          if (authType == AuthType.signin) {
            await _signin(email: email, password: password, username: username);
          } else {
            await _login(email: email, password: password);
          }
          Navigator.of(context).pushReplacementNamed(WholeScreen.routename);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(showsnackbar('There is no internet connection'));
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(showsnackbar(e.toString()));
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
}
