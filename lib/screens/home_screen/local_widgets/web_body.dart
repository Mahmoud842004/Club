import 'package:club/screens/home_screen/local_widgets/web_navigationbar.dart';
import 'package:flutter/material.dart';

class WebBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: WebNavigationBar(),
          flex: 1,
        ),
        Expanded(
          child: Container(
            color: Colors.black,
          ),
          flex: 3,
        ),
        Expanded(
          child: Container(
            color:Colors.yellow,
          ),
          flex: 2,
        )
      ],
    );
  }
}
