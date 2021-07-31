import 'package:club/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: ()=>Auth().signout(context),
              child: Center(
          child: Text('home screen').tr(),
        ),
      ),
    );
  }
}
