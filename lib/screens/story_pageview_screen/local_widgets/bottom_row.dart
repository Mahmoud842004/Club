import 'package:club/constants.dart';
import 'package:club/models/screendata.dart';
import 'package:club/models/story.dart';
import 'package:club/models/users.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/widgets/app_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomRow extends StatelessWidget {
  BottomRow({
    required this.currentstory,
    required this.user,
    required this.bottompadding,
  });
  final Story? currentstory;
  final Users user;
  final double bottompadding;

  @override
  Widget build(BuildContext context) {
    final ScreenData screendata = ResponsiveAddaptive.screendata(context);
    TextEditingController controller = TextEditingController();
    //TODO:add send messages feature
    return Positioned(
      bottom: bottompadding + screendata.screensize.height * 0.005,
      right: screendata.screensize.width * 0.05,
      left: screendata.screensize.width * 0.05,
      child: Row(
        children: [
          Expanded(
            flex: 15,
            child: AppTextField(
              controller: controller,
              decoration:
                  storydecoration.copyWith(hintText: 'Reply to a story'),
            ),
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Icon(
            ResponsiveAddaptive.isios()
                ? CupertinoIcons.arrow_right_circle_fill
                : Icons.send,
          )
        ],
      ),
    );
  }
}
