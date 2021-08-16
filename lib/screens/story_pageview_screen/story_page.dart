import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club/models/screendata.dart';
import 'package:club/models/story.dart';
import 'package:club/models/users.dart';
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
  bool ispaused = false;
  @override
  void initState() {
    FireStore().getstorieslist(widget.user.stories).then((value) {
      if (value != null) {
        if (value.runtimeType != String) {
          if (mounted) {
            setState(() {
              storieslist = value;
            });
            if (widget.currentuser) {
              setState(
                () {
                  currentstory = storieslist.firstWhere(
                    (element) {
                      if (element.watched) {
                        return false;
                      } else {
                        return true;
                      }
                    },
                    orElse: () => Story(
                      id: 'null',
                      watched: false,
                      content: 'null',
                      time: Timestamp.now(),
                      imageurl: null,
                      videotime: null,
                      videourl: null,
                      watches: null,
                    ),
                  );
                },
              );

              if (currentstory!.id == 'null') {
                setState(() {
                  currentstory = storieslist.first;
                });
              }
            } else {
              setState(() {
                currentstory = storieslist.firstWhere(
                  (element) {
                    if (element.watches!.contains(widget.currentuserid)) {
                      return false;
                    } else {
                      return true;
                    }
                  },
                );
              });
            }
          }
        } else {
          if (mounted) {
            setState(() {
              haserror = true;
            });
          }
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenData screendata = ResponsiveAddaptive.screendata(context);
    final bottompadding = MediaQuery.of(context).viewPadding.bottom;
    return AppScaffold(
      body: SafeArea(
        child: GestureDetector(
          onLongPressStart: (details) {
            setState(() {
              ispaused = true;
            });
          },
          onLongPressEnd: (details) {
            setState(() {
              ispaused = false;
            });
          },
          child: Stack(
            children: [
              ImageOrVideo(
                haserror: haserror,
                currentstory: currentstory,
                ispaused: ispaused,
                changecurrentstory: (newstory) {
                  if (mounted) {
                    currentstory = newstory;
                  }
                },
              ),
              RightAndLeft(
                changestory: (story) {
                  setState(() {
                    currentstory = story;
                  });
                },
                controller: widget.controller,
                currentstory: currentstory != null ? currentstory : null,
                index: widget.index,
                userslist: widget.userslist,
                currentuser: widget.currentuser,
                storieslist: storieslist,
              ),
              StoriesLine(
                storieslist: storieslist,
                screendata: screendata,
                currentuser: widget.currentuser,
                currentstory: currentstory != null ? currentstory : null,
                changecurrentstory: (story) {
                  if (mounted) {
                    setState(() {
                      currentstory = story;
                    });
                  }
                },
                storieslenght: widget.user.stories.length,
                ispaused: ispaused,
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
                currentstory: currentstory != null ? currentstory : null,
              ),
              widget.currentuser
              //TODO: make watching text
                  ? Container()
                  : BottomRow(
                      currentstory: currentstory,
                      user: widget.user,
                      screendata: screendata,
                      bottompadding: bottompadding,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
