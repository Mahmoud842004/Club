import 'dart:io';
import 'package:club/constants.dart';
import 'package:club/models/screendata.dart';
import 'package:club/models/users.dart';
import 'package:club/screens/confirm_story_screen/local_widget/confirm_story_video.dart';
import 'package:club/screens/confirm_story_screen/local_widget/sendbutton.dart';
import 'package:club/screens/confirm_story_screen/local_widget/textfield.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/widgets/app_appbar.dart';
import 'package:club/widgets/app_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ConfirmStoryScreen extends StatefulWidget {
  final File file;
  final String filetype;
  final BuildContext lastcontext;

  ConfirmStoryScreen({required this.filetype, required this.file,required this.lastcontext});

  @override
  State<ConfirmStoryScreen> createState() => _ConfirmStoryScreenState();
}

class _ConfirmStoryScreenState extends State<ConfirmStoryScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    controller.dispose();
    super.dispose();
  }

  int? videoduration;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Users? user = Provider.of<Users?>(context);
    ScreenData screendata = ResponsiveAddaptive.screendata(context);
    bool islandscape =
        screendata.screentype == ScreenType.landscape ? true : false;
    var bottompadding = MediaQuery.of(context).viewInsets.bottom;
    return AppScaffold(
      resizeToAvoidBottomInset:false,
      appbar: theAppBar(
          title: Container(),
          color: theme['white'],
          elevation: 0.0,
          iconscolor: theme['black']),
      color: theme['white'],
      body: user == null
          ? Container(
              width: screendata.screensize.width * 0.2,
              height: screendata.screensize.height * 0.01,
              child: CircularProgressIndicator.adaptive(
                backgroundColor: theme['white'],
                valueColor: AlwaysStoppedAnimation(theme['black']),
              ),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  widget.filetype == 'video'
                      ? Align(
                          alignment: Alignment.center,
                          child: ConfirmStoryVideo(
                            file: widget.file,
                            screendata: screendata,
                            getvideoduration: (secounds) {
                              setState(
                                () {
                                  videoduration = secounds;
                                },
                              );
                            },
                          ),
                        )
                      : Align(
                          alignment: islandscape
                              ? Alignment.topCenter
                              : Alignment.center,
                          child: Image.file(
                            widget.file,
                            width: screendata.screensize.width,
                            height: islandscape
                                ? screendata.screensize.height * 0.6
                                : screendata.screensize.height * 0.5,
                            fit: BoxFit.fill,
                          ),
                        ),
                  Positioned(
                    right: screendata.screensize.width * 0.03,
                    left: screendata.screensize.width * 0.03,
                    bottom: bottompadding + 10,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConfirmTextField(controller: controller),
                        ActionButton(
                          user: user,
                          filetype: widget.filetype,
                          file: widget.file,
                          content: controller.text,
                          videoduration: videoduration,
                          screendata: screendata,
                          lastcontext:widget.lastcontext
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
