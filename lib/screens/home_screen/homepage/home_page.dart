import 'package:club/models/screendata.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/widgets/app_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'local_widgets/local_widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomePageAppBar(),
            Builder(builder: (context) {
              ScreenData screenData = ResponsiveAddaptive.screendata(context);
              User? provider = Provider.of<User?>(context);
              return Padding(
                padding: EdgeInsets.all(screenData.screensize.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StoryText(),
                    StoryListView(
                      userprovider: provider,
                      screendata: screenData,
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
