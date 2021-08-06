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
        Image.asset(
          'icon.jfif',
          width: screenData.screensize.width * 0.3,
          height: screenData.screensize.height * 0.05,
          fit: BoxFit.cover,
        ),
        SizedBox(height: screenData.screensize.width * 0.1),
        TextField(),
      ],
    );
  }
}
