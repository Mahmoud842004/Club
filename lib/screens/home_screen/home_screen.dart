import 'package:club/models/screendata.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

import 'local_widgets/local_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(
      length: 5,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isweb =
        ResponsiveAddaptive.screendata(context).screentype == ScreenType.web
            ? true
            : false;
    return AppScaffold(
      appbar: isweb
          ? AppBar(
              title: WebAppBarBody(),
            )
          : null,
      body: isweb ? WebBody() : PhoneBody(controller:controller),
      bottomnavigationbar: isweb ? null : PhoneNavigationBar(controller:controller),
    );
  }
}
