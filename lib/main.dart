import 'package:auto_direction/auto_direction.dart';
import 'package:club/models/material_pagetheme.dart';
import 'package:club/screens/whole_screen.dart';
import 'package:club/services/auth.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'lang',
      useOnlyLangCode: true,
      assetLoader: RootBundleAssetLoader(),
      fallbackLocale: Locale('en'),
      saveLocale: true,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO:enable the app for the web
    //TODO:make google and facebook auth
    var user = Auth().getcurrentuser();
    return MultiProvider(
      providers: [
        Provider<User?>.value(value: user),
      ],
      child: Builder(
        builder: (context) {
          var text = context.locale == Locale('en') ? 'a' : 'ا';
          return AutoDirection(
            text: text,
            child: ResponsiveAddaptive.isios()
                ? CupertinoApp(
                    title: 'Club',
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    localizationsDelegates: context.localizationDelegates,
                    home: WholeScreen(),
                  )
                : MaterialApp(
                    title: 'Club',
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    localizationsDelegates: context.localizationDelegates,
                    initialRoute: '/',
                    theme: Theme.of(context).copyWith(
                      pageTransitionsTheme: PageTransitionsTheme(
                        builders: {
                          TargetPlatform.android: AndriodPageTransition(),
                        },
                      ),
                    ),
                    routes: {
                      WholeScreen.routename: (context) => WholeScreen(),
                    },
                  ),
          );
        },
      ),
    );
  }
}
