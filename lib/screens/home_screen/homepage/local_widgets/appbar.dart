import 'package:club/models/screendata.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../constants.dart';

class HomePageAppBar extends StatelessWidget {
  final ScreenData screendata;
  HomePageAppBar({required this.screendata});
  @override
  Widget build(BuildContext context) {
    bool landscapecheck =
        screendata.screentype == ScreenType.landscape ? true : false;
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: screendata.screensize.width * 0.05),
      width: screendata.screensize.width,
      height: landscapecheck
          ? screendata.screensize.height * 0.2
          : screendata.screensize.height * 0.1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            theme['pink']!,
            theme['white']!,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Club',
            style: textstyles['large'],
          ),
          Icon(
            ResponsiveAddaptive.isios()
                ? CupertinoIcons.paperplane_fill
                : FontAwesomeIcons.paperPlane,
          )
        ],
      ),
    );
  }
}
