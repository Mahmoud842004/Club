import 'package:club/screens/login_screen/local_widgets/facebooksigninbutton.dart';
import 'package:club/screens/login_screen/local_widgets/googlesigninbutton.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/material.dart';

class ExternalSigninRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isweb = ResponsiveAddaptive.isweb();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        GoogleSigninButton(),
        isweb ? SizedBox.shrink() : FacebookSigninButton(),
      ],
    );
  }
}
