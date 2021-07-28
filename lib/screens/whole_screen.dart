import 'package:club/screens/home_screen/home_screen.dart';
import 'package:club/screens/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WholeScreen extends StatelessWidget {
  const WholeScreen();
  @override
  Widget build(BuildContext context) {
    var authprovider = Provider.of<User>(context);
    if (authprovider.runtimeType == User) {
      return LoginScreen();
    } else {
      return HomeScreen();
    }
  }
}
