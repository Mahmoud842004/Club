import 'package:club/constants.dart';
import 'package:club/models/screendata.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';

class WebAppBarBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: make the search textfield
    ScreenData screenData = ResponsiveAddaptive.screendata(context);
    return Row(
      children: [
       Text('Club',style:textstyles['large']),
        SizedBox(height: screenData.screensize.width * 0.1),
        TextField(),
      ],
    );
  }
}
