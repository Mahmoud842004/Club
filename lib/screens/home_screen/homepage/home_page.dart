import 'package:club/models/screendata.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/widgets/app_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'local_widgets/local_widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenData screenData = ResponsiveAddaptive.screendata(context);
    User? provider = Provider.of<User?>(context);
    return AppScaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomePageAppBar(screendata: screenData),
            Padding(
              padding: EdgeInsets.all(screenData.screensize.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StoryText(),
                  StoryListView(userprovider: provider, screendata: screenData),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
