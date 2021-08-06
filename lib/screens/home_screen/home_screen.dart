import 'package:club/models/screendata.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

import 'local_widgets/local_widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isweb =
        ResponsiveAddaptive.screendata(context).screentype == ScreenType.web
            ? true
            : false;
    return DefaultTabController(
      length: 5,
      child: AppScaffold(
        appbar: isweb
            ? AppBar(
                title: WebAppBarBody(),
              )
            : null,
        body: isweb ? WebBody() : PhoneBody(),
        bottomnavigationbar: isweb ? null : PhoneNavigationBar(),
      ),
    );
  }
}
