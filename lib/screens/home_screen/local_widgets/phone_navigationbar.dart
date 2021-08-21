import 'package:flutter/material.dart';

import '../../../constants.dart';

class PhoneNavigationBar extends StatelessWidget {
  final TabController controller;
  PhoneNavigationBar({required this.controller});
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      indicatorWeight: 2,
      indicatorColor: theme['black'],
      labelColor: theme['black'],
      unselectedLabelColor: Colors.grey,
      tabs: tabslist.map((e) {
        return Tab(icon: e);
      }).toList(),
    );
  }
}
