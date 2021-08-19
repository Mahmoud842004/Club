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
    required this.ontap,
    this.laststory,
    this.iscurrentuser = false,
  });
  StoryWidget.currentuser({
    required this.user,
    required this.screendata,
    required this.laststory,
    required this.ontap,
    this.iscurrentuser = true,
  });

  final Users user;
  final ScreenData screendata;
  final Story? laststory;
  final bool iscurrentuser;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    bool hasprofileimage = user.profileimage != null ? true : false;
    return Container(
      margin: EdgeInsets.only(
        right: screendata.screensize.width * 0.05,
      ),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(35),
            onTap: () {
              ontap();
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: iscurrentuser && user.stories.isEmpty
                        ? null
                        : Border.all(
                            color: iscurrentuser && laststory!.watched
                                ? Colors.grey[400]!
                                : theme['pink']!.withOpacity(0.7),
                            width: 3,
                          ),
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[400],
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
                iscurrentuser && user.stories.isEmpty
                    ? Positioned(
                        bottom: 0.0,
                        right: screendata.screensize.width * 0.10,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: theme['pink']!.withOpacity(0.7),
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              ResponsiveAddaptive.isios()
                                  ? CupertinoIcons.add
                                  : Icons.add,
                              size: 17,
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          SizedBox(height: screendata.screensize.height * 0.01),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SizedBox(
                width:constraints.maxWidth,
                child: Text(
                  user.name,
                  style: textstyles['very small'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
