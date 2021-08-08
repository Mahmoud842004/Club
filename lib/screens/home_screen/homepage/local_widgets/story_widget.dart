import 'package:club/constants.dart';
import 'package:club/models/screendata.dart';
import 'package:club/models/story.dart';
import 'package:club/models/users.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  StoryWidget({
    required this.user,
    required this.screendata,
    this.story,
    this.iscurrentuser = false,
  });
  StoryWidget.currentuser({
    required this.user,
    required this.screendata,
    required this.story,
    required this.iscurrentuser,
  });

  final Users user;
  final ScreenData screendata;
  final Story? story;
  final bool? iscurrentuser;

  @override
  Widget build(BuildContext context) {
    bool hasprofileimage = user.profileimage != null ? true : false;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            right: screendata.screensize.width * 0.05,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: iscurrentuser! && story == null
                      ? null
                      : Border.all(
                          color: iscurrentuser! && story!.watched
                              ? Colors.grey[400]!
                              : theme['pink']!,
                          width: 3,
                        ),
                ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: hasprofileimage ? null : Colors.grey[400],
                  backgroundImage: hasprofileimage
                      ? NetworkImage(
                          user.profileimage.toString(),
                        )
                      : null,
                  child: hasprofileimage
                      ? null
                      : Icon(
                          ResponsiveAddaptive.isios()
                              ? CupertinoIcons.person
                              : Icons.person,
                          color: theme['black'],
                        ),
                ),
              ),
              SizedBox(height: screendata.screensize.height * 0.01),
              Text(user.name, style: textstyles['very small'])
            ],
          ),
        ),
        iscurrentuser! && story == null
            ? Positioned(
              bottom: screendata.screensize.height*0.001,
              right: screendata.screensize.width*0.01,
              left: screendata.screensize.width*0.001,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: theme['pink'],
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(ResponsiveAddaptive.isios()
                        ? CupertinoIcons.add
                        : Icons.add),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
