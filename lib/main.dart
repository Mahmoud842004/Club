import 'package:auto_direction/auto_direction.dart';
import 'package:club/constants.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
      ],
      path: 'lang/',
      fallbackLocale: Locale('en', 'US'),
      saveLocale: true,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var text = context.locale == Locale('en', 'US') ? 'a' : 'ا';
    return AutoDirection(
      text: text,
      child: ResponsiveAddaptive.isios()
          ? CupertinoApp(
              title: 'Club',
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              localizationsDelegates: context.localizationDelegates,
              initialRoute: '/',
              routes: routes,
            )
          : MaterialApp(
              title: 'Club',
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              localizationsDelegates: context.localizationDelegates,
              initialRoute: '/',
              routes: routes,
            ),
    );
  }
}
