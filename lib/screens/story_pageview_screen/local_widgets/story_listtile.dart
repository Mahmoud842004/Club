import 'package:club/constants.dart';
import 'package:club/models/screendata.dart';
import 'package:club/models/story.dart';
import 'package:club/models/users.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/widgets/show_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryListTile extends StatelessWidget {
  StoryListTile(
      {required this.screendata,
      required this.user,
      required this.currentstory});

  final ScreenData screendata;
  final Users user;
  final Story? currentstory;

  @override
  Widget build(BuildContext context) {
    final bool hasprofileimage = user.profileimage == null ? false : true;
    return Positioned(
      top: screendata.screensize.height * 0.03,
      left: 0.0,
      right: 0.0,
      child: ListTile(
        subtitle: currentstory != null
            ? FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.toString(),
                      style: textstyles['small grey'],
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
                future: showtime(
                    time: currentstory!.time.toDate(), context: context),
              )
            : null,
        minLeadingWidth: 40,
        title: Text(
          user.name,
          style: textstyles['small white'],
        ),
        trailing: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            ResponsiveAddaptive.isios() ? CupertinoIcons.xmark : Icons.close,
          ),
        ),
        leading: CircleAvatar(
          radius: 20,
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
    );
  }
}
