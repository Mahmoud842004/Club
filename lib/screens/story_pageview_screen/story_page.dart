import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club/models/story.dart';
import 'package:club/models/users.dart';
import 'package:club/state_mangment/story_pause.dart';
import 'package:provider/provider.dart';
import 'local_widgets/local_widgets.dart';
import 'package:club/services/firestore.dart';
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
          if (mounted) {
            setState(() {
              storieslist = value;
              if (widget.currentuser) {
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

                if (currentstory!.id == 'null') {
                  currentstory = storieslist.first;
                }
              } else {
                currentstory = storieslist.firstWhere(
                  (element) {
                    if (element.watches!.contains(widget.currentuserid)) {
                      return false;
                    } else {
                      return true;
                    }
                  },
                );
              }
            });
            if (currentstory!.videourl != null) {
              Provider.of<StoryPause>(context, listen: false).switchpause(true);
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
    final bottompadding = MediaQuery.of(context).viewPadding.bottom;
    return AppScaffold(
      color: Colors.grey[800],
      body: SafeArea(
        child: GestureDetector(
          onLongPressStart: (details) {
            Provider.of<StoryPause>(context, listen: false).switchpause(true);
          },
          onLongPressEnd: (details) {
            Provider.of<StoryPause>(context, listen: false).switchpause(false);
          },
          child: Stack(
            children: [
              ImageOrVideo(
                haserror: haserror,
                currentstory: currentstory,
              ),
              RightAndLeft(
                changestory: (story) {
                  setState(() {
                    currentstory = story;
                  });
                  if (currentstory!.videourl != null) {
                    Provider.of<StoryPause>(context, listen: false)
                        .switchpause(true);
                  }
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
                currentuser: widget.currentuser,
                currentstory: currentstory != null ? currentstory : null,
                changecurrentstory: (story) {
                  if (mounted) {
                    setState(() {
                      currentstory = story;
                    });
                    if (currentstory!.videourl != null) {
                      Provider.of<StoryPause>(context, listen: false)
                          .switchpause(true);
                    }
                  }
                },
                storieslenght: widget.user.stories.length,
                userindex: widget.index,
                userslist: widget.userslist,
                controller: widget.controller,
              ),
              StoryListTile(
                user: widget.user,
                currentstory: currentstory != null ? currentstory : null,
              ),
              StoryContent(
                currentstory: currentstory != null ? currentstory : null,
              ),
              widget.currentuser
                  ? currentstory == null
                      ? SizedBox.shrink()
                      : WatchesIndicator(
                          currentstory: currentstory,
                        )
                  : BottomRow(
                      currentstory: currentstory,
                      user: widget.user,
                      bottompadding: bottompadding,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
