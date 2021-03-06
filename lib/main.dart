import 'dart:async';
import 'package:auto_direction/auto_direction.dart';
import 'package:club/models/users.dart';
import 'package:club/providers/current_page.dart';
import 'package:club/providers/obsure_password.dart';
import 'package:club/screens/whole_screen.dart';
import 'package:club/services/auth.dart';
import 'package:club/services/firestore.dart';
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
    //TODO:fix web app version sizes
    User? user = Auth().getcurrentuser();
    return MultiProvider(
      providers: [
        Provider<User?>.value(value: user),
        StreamProvider<Users?>.value(
          value: user == null
              ? Stream.empty()
              : FireStore(id: user.uid).userstream,
          initialData: null,
        ),
        ChangeNotifierProvider<CurrentPageProvider>.value(
          value: CurrentPageProvider(),
        ),
        ChangeNotifierProvider<ObsureProvider>.value(
          value: ObsureProvider(),
        ),
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
                    home: WholeScreen(),
                  ),
          );
        },
      ),
    );
  }
}
