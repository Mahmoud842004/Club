import 'package:club/models/screendata.dart';
import 'package:club/models/story.dart';
import 'package:club/models/users.dart';
import 'package:club/screens/story_pageview_screen/local_widgets/stories_upper_line.dart';
import 'local_widgets/local_widgets.dart';
import 'package:club/services/firestore.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/widgets/app_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  final Users user;
  final int? index;
  final String? currentuserid;
  final PageController? controller;
  final List<Map<String, dynamic>>? userslist;
  final bool currentuser;

  StoryPage({
    required this.user,
    required this.index,
    required this.currentuserid,
    required this.controller,
    required this.userslist,
    this.currentuser = false,
  });

  StoryPage.currentuser({
    required this.user,
    this.index,
    this.currentuserid,
    this.controller,
    this.userslist,
    this.currentuser = true,
  });

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  List<Story> storieslist = [];
  bool haserror = false;
  Story? currentstory;
  @override
  void initState() {
    FireStore().getstorieslist(widget.user.stories).then((value) {
      if (value != null) {
        if (value.runtimeType != String) {
          setState(
            () {
              storieslist = value;
              currentstory =widget.currentuser?storieslist.firstWhere((element){
                if(element.watched){
                 return false;
                }else{
                  return true;
                }
              }): storieslist.firstWhere(
                (element) {
                  if (element.watches!.contains(widget.currentuserid)) {
                    return false;
                  } else {
                    return true;
                  }
                },
              );
            },
          );
        } else {
          setState(() {
            haserror = true;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenData screendata = ResponsiveAddaptive.screendata(context);
    return AppScaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ImageOrVideo(
              haserror: haserror,
              currentstory: currentstory,
              changecurrentstory: (newstory) {
                if (mounted) {
                  currentstory = newstory;
                }
              },
            ),
            StoriesLine(
              storieslist: storieslist,
              screendata: screendata,
              currentuser:widget.currentuser,
              currentstory: currentstory != null ? currentstory : null,
              changecurrentstory: (story) {
                if (mounted) {
                  setState(() {
                    currentstory = story;
                  });
                }
              },
              storieslenght: widget.user.stories.length,
              userindex: widget.index,
              userslist: widget.userslist,
              controller: widget.controller,
            ),
            StoryListTile(
              screendata: screendata,
              user: widget.user,
              currentstory: currentstory != null ? currentstory : null,
            ),
            StoryContent(
                screendata: screendata,
                currentstory: currentstory != null ? currentstory : null),
          ],
        ),
      ),
    );
  }

}
